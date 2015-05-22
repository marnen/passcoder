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
end
