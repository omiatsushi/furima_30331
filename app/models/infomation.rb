class Infomation < ApplicationRecord
    extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to :shopping_address
  belongs_to :order
end
