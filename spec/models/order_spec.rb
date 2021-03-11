require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
  
  describe '商品注文情報の登録' do
  context '商品購入情報登録できる時' do
      it '全ての情報が正しく入力されている場合登録できる' do
        binding.pry
        expect(@order).to be_valid
      end
      it '建物は空の場合でも登録できる' do
      end
    end

      context '商品購入情報登録できない時' do
        it '郵便番号が空の場合登録できない' do
        end
        it '郵便番号にハイフンがない場合登録できない' do
        end
        it '郵便番号が全角の場合登録できない' do
        end
        it '市区町村が空の場合登録できない' do
        end
        it '市区町村が全角でない場合登録できない' do
        end
        it '番地が空の場合登録できない' do
        end
        it '電話番号が空の場合登録できない' do
        end
        it '電話番号が全角の場合登録できない' do
        end
        it '都道府県を選択していない登録できない' do
        end
        it '' do
        end

        
      end
    end
  end