class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        validates :password, presence: true, format: {with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i}
        validates :nickname, presence: true
        validates :first_name, presence: true, format: {with: /\A[あ-んア-ン一-龥]/}
        validates :second_name, presence: true, format: {with: /\A[あ-んア-ン一-龥]/}
        validates :first_name_furigana, presence: true, format: {with: /\A[ア-ヶーー]+\z/}
        validates :second_name_furigana, presence: true, format: {with: /\A[ア-ヶーー]+\z/}
        validates :birthday, presence: true

        has_many :items
        has_many :buyers
end
