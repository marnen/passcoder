require 'rails_helper'

RSpec.describe Item, type: :model do
  subject { FactoryGirl.create :item }

  it { should have_many :line_items }

  [:name, :abbreviation].each do |field|
    it { should validate_presence_of field }
    it { should validate_uniqueness_of field }
  end
end
