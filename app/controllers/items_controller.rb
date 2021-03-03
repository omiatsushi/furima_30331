class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :state_id, :delivery_fee_id, :shopping_address_id,
                                 :shopping_day_id, :price).merge(user_id: current_user.id)
  end

  # def get_deliveryfee
    # fees = ['---', '着払い(購入者負担)', '送料込み(出品者負担)']
    # d_fees = fees[@fee_num]
    # delivery_fee.push(fees)
  # end

end
