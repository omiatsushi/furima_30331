class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

      with_options presence: true do
          validates :nickname
          validates :birthday
         validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
         with_options format: {with: /\A[ぁ-んァ-ン一-龥々]/} do
          validates :first_name
          validates :second_name
         end
         with_options format: {with: /\A[ア-ヶーー]+\z/} do
          validates :first_name_furigana
          validates :second_name_furigana
         end
        end
        
        has_many :items
        has_many :buyers
end
