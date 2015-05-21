require 'rails_helper'

RSpec.describe LineItem, type: :model do
  it { should belong_to :item }
  it { should belong_to :passcode }

  [:item_id, :item_level, :passcode, :quantity].each do |field|
    it { should validate_presence_of field }
  end
end
