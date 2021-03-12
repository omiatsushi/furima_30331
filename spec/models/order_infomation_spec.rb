require 'rails_helper'

RSpec.describe OrderInfomation, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.build(:item)
    item.image = fixture_file_upload('app/assets/images/flag.png')
    item.save
    @order = FactoryBot.build(:order_infomation)
    @order.item_id = item.id
    @order.user_id = user.id
    sleep(1)
  end
  
  describe '商品注文情報の登録' do
  context '商品購入情報登録できる時' do
      it '全ての情報が正しく入力されている場合登録できる' do
        expect(@order).to be_valid
      end
      it '建物は空の場合でも登録できる' do
        @order.build = ''
        expect(@order).to be_valid
      end
    end

      context '商品購入情報登録できない時' do
        it '郵便番号が空の場合登録できない' do
          @order.address_number = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Address number can't be blank")
        end
        it '郵便番号にハイフンがない場合登録できない' do
          @order.address_number = '111111'
          @order.valid?
          expect(@order.errors.full_messages).to include("Address number is invalid")
        end
        it '郵便番号が全角の場合登録できない' do
          @order.address_number = '１１１-１１１１'
          @order.valid?
          expect(@order.errors.full_messages).to include("Address number is invalid")
        end
        it '市区町村が空の場合登録できない' do
          @order.address = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Address can't be blank")
        end
        it '番地が空の場合登録できない' do
          @order.city = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("City can't be blank")
        end
        it '電話番号が空の場合登録できない' do
          @order.phone_number = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number can't be blank")
        end
        it '電話番号が全角の場合登録できない' do
          @order.phone_number = '０９０１１１１１１１１'
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number is invalid")
        end
        it '電話番号が12桁以上の場合登録できない' do
          @order.phone_number = '090111111111'
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number is invalid")
        end
        it '電話番号が英数混合の場合登録できない' do
          @order.phone_number = '090abcd1234'
          @order.valid?
          expect(@order.errors.full_messages).to include("Phone number is invalid")
        end
        it '都道府県を選択していない登録できない' do
          @order.shopping_address_id = 0
          @order.valid?
          expect(@order.errors.full_messages).to include("Shopping address must be other than 0")
        end
        it 'user_idが空の場合登録できない' do
          @order.user_id = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("User can't be blank")
        end
        it 'item_idが空の場合登録できない' do
          @order.item_id = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Item can't be blank")
        end
        it 'tokenが空の場合登録できない' do
          @order.token = ''
          @order.valid?
          expect(@order.errors.full_messages).to include("Token can't be blank")
        end

        
      end
    end
end