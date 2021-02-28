FactoryBot.define do
  factory :item do
    name                   { Faker::Team.name }
    explanation            { '3' }
    category_id            { 3 }
    state_id               { 3 }
    delivery_fee_id        { 3 }
    shopping_day_id        { 3 }
    shopping_address_id    { 3 }
    price                  { 10000 }
    association :user
  end
end
