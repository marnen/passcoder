require 'rails_helper'

RSpec.describe Passcode, type: :model do
  it { should validate_presence_of :code }
  it { should validate_uniqueness_of :code }
  it { should validate_numericality_of :ap }
  it { should validate_numericality_of :xm }

  describe '.permitted_params' do
    subject { Passcode.permitted_params }

    [:code, :ap, :xm].each do |field|
      it { should include field }
    end
  end
end
