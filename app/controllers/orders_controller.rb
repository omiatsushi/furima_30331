class OrdersController < ApplicationController
  before_action :set_order, only: [:index, :create]
  before_action :authenticate_user!
  before_action :move_to_index
  

  def index
    @order_infomation = OrderInfomation.new
  end


  def create
   
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

  def set_order
    @item = Item.find(params[:item_id])
  end

  def order_params
  params.require(:order_infomation).permit(:address_number, :shopping_address_id, :address, :city, :build, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def move_to_index
    if @item.user_id == current_user.id || @item.order.present?
      redirect_to root_path
    end
  end

  

end