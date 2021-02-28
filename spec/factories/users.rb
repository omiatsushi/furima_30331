FactoryBot.define do
  factory :user do
    nickname                { 'satou' }
    first_name              { '佐藤' }
    second_name             { '詩織' }
    first_name_furigana     { 'サトウ' }
    second_name_furigana    { 'シオリ' }
    email                   { Faker::Internet.free_email }
    password                { Faker::Internet.password(min_length: 6) }
    password_confirmation   { password }
    birthday                { Faker::Date.birthday(min_age: 18, max_age: 65) }
  end
end
