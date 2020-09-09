FactoryBot.define do
  factory :item do
    item        { Faker::String.random }
    detail      { Faker::Lorem.sentence }
    category_id { Faker::Number.between(from: 2, to: 11) }
    status_id   { Faker::Number.between(from: 2, to: 7) }
    deli_fee_id { Faker::Number.between(from: 2, to: 3) }
    area_id     { Faker::Number.between(from: 2, to: 48) }
    deli_day_id { Faker::Number.between(from: 2, to: 4) }
    price       { Faker::Number.between(from: 300, to: 9_999_999) }
    association :user
  end
end
