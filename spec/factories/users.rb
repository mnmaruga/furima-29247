FactoryBot.define do
  factory :user do
    name                  { Faker::Name.last_name }
    email                 { Faker::Internet.email }
    password = Faker::Internet.password(min_length: 6)
    password              { password }
    password_confirmation { password }
    first_name            { Gimei.last.kanji }
    last_name             { Gimei.first.kanji }
    first_name_kana       { Gimei.last.katakana }
    last_name_kana        { Gimei.first.katakana }
    birth                 { Faker::Date.birthday }
  end
end
