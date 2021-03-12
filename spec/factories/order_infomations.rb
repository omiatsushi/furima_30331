FactoryBot.define do
  factory :order_infomation do
    address_number { '111-1111' }
    shopping_address_id { 3 }
    address { '横浜市緑区' }
    city { '青山1' }
    build { 'サンハウス' }
    phone_number { '09012345678' }
    token { 'token' }
    
    end
  end
