require 'rails_helper'

RSpec.describe Passcode, type: :model do
  it { should validate_presence_of :code }
  it { should validate_uniqueness_of :code }
  it { should validate_numericality_of :xm }
end
