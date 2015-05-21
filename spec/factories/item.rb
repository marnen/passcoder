FactoryGirl.define do
  factory :item do
    name { FFaker::HipsterIpsum.words(rand 1..3).join ' '}
  end
end
