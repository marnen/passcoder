FactoryGirl.define do
  factory :line_item do
    passcode
    item
    item_level { rand 1..8 }
    quantity { rand 1..10 }
  end
end
