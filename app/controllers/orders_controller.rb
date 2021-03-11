class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index
  before_action :sold_out_index


  def index
    @item = Item.find(params[:item_id])
    @order_infomation = OrderInfomation.new
  end


  def create
   
    @item = Item.find(params[:item_id])
    @order_infomation = OrderInfomation.new(order_params)
    if @order_infomation.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'    
      )
      @order_infomation.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def order_params
  params.require(:order_infomation).permit(:address_number, :shopping_address_id, :address, :city, :build, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def move_to_index
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id || @item.order.present?
      redirect_to root_path
    end
  end

end