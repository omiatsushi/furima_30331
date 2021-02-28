require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('app/assets/images/flag.png')
  end

  context '商品新規登録できる時' do
    describe '商品新規登録' do
      it '必要事項が入力されていれば新規登録できる' do
        expect(@item).to be_valid
      end
    end
  end

  context '商品新規登録できない時' do
    describe '商品新規登録' do
      it '商品名が空の場合登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '販売価格が空の場合登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が全角の場合登録できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it '販売価格が299以下の場合登録できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '販売価格が10000000以上の場合登録できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '画像が空の場合登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品説明が空の場合登録できない' do
        @item.explanation = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Explanation can't be blank")
      end

      it 'カテゴリーIDが1の場合登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end

      it '商品状態IDが1の場合登録できない' do
        @item.state_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('State must be other than 1')
      end

      it '商品料配送IDが1の場合登録できない' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery fee must be other than 1')
      end

      it '商品発送日数IDが1の場合登録できない' do
        @item.shopping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shopping day must be other than 1')
      end

      it '発送元の地域IDが1の場合登録できない' do
        @item.shopping_address_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Shopping address must be other than 1')
      end
    end
  end
end
