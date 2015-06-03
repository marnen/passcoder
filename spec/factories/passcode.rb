FactoryGirl.define do
  factory :passcode do
    code { FFaker::Lorem.characters rand 8..20 }
    ap { rand 1000 }
    xm { rand 1000 }
  end
end
