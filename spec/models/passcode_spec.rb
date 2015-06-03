require 'rails_helper'

RSpec.describe Passcode, type: :model do
  describe 'associations' do
    it { should have_many(:line_items).inverse_of :passcode }
    it { should accept_nested_attributes_for :line_items }
  end

  describe 'validations' do
    it { should validate_presence_of :code }
    it { should validate_uniqueness_of :code }
    it { should validate_numericality_of :ap }
    it { should validate_numericality_of :xm }
  end

  describe '.new_with_line_items' do
    subject { Passcode.new_with_line_items }

    it 'returns a new passcode' do
      should be_a_kind_of Passcode
      should be_a_new_record
    end

    it 'creates a line item on the passcode' do
      expect(subject.line_items).not_to be_empty
    end
  end

  describe '.permitted_params' do
    subject { Passcode.permitted_params }

    before(:each) { Passcode.class_eval { @permitted_params = nil } } # TODO: Yuck! Is there another way to disable memoization?

    [:code, :ap, :xm].each do |field|
      it { should include field }
    end

    it 'includes LineItem.permitted_params for nested attributes' do
      attributes = (1..3).collect { FFaker::Lorem.word.to_sym }
      allow(LineItem).to receive(:permitted_params).and_return attributes
      expect(subject).to include line_items_attributes: attributes
    end
  end

  describe '.with_items' do
    subject { Passcode.with_items }

    it 'returns all passcodes' do
      passcodes = (1..3).collect { FactoryGirl.create :passcode }
      expect(subject.sort).to be == passcodes.sort
    end

    it 'includes items through line items' do
      passcode = FactoryGirl.create :passcode
      FactoryGirl.create :line_item, passcode: passcode
      line_items = subject.first.line_items

      expect(line_items).to be_loaded
      expect(line_items.first.association :item).to be_loaded
    end
  end
end
