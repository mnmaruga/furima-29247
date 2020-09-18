FactoryBot.define do
  factory :order_address do
    postal     { '123-4567' }
    prefect_id { Faker::Number.between(from: 2, to: 48) }
    city       { '港区' }
    address    { '1-1' }
    building   { Faker::String.random }
    tel        { Faker::Number.number(digits: 11) }
    token      { Faker::Lorem.characters }
    price      { Faker::Number.between(from: 300, to: 9_999_999) }
  end
end
