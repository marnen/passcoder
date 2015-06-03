require 'rails_helper'

RSpec.describe LineItem, type: :model do
  it { should belong_to :item }
  it { should belong_to :passcode }

  [:item_id, :item_level, :passcode, :quantity].each do |field|
    it { should validate_presence_of field }
  end

  describe '.permitted_params' do
    subject { LineItem.permitted_params }

    [:item_id, :item_level, :quantity].each do |field|
      it { should include field }
    end
  end
end
