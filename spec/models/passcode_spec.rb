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

    [:code, :ap, :xm].each do |field|
      it { should include field }
    end
  end
end
