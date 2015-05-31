FactoryGirl.define do
  factory :item do
    name { FFaker::HipsterIpsum.words(rand 1..3).join ' '}
    abbreviation { FFaker::Lorem.characters 1 }
  end
end
