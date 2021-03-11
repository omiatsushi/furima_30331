class OrderInfomation
  include ActiveModel::Model
  attr_accessor :address_number, :shopping_address_id, :city, :address, :phone_number, :build, :user_id, :item_id, :token

  with_options presence: true do
    validates :address_number, format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :shopping_address_id, numericality: { other_than: 0 }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/ }
    validates :token
    validates :user_id
    validates :item_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    
    Infomation.create(address_number: address_number, shopping_address_id: shopping_address_id, city: city, address: address, phone_number: phone_number, order_id: order.id)

  end
end