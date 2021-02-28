class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :explanation
    validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
    validates :image
  end

  # with_options numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 } do
  #   validates :price
  # end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :state_id
    validates :delivery_fee_id
    validates :shopping_address_id
    validates :shopping_day_id
  end

  belongs_to :user
  has_one :buyer
  has_one_attached :image
end
