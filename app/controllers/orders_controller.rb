class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_order_payjp, only: [:index, :create]
  before_action :order_current_user, only: [:index]
  def index
    @order_payjp = OrderPayjp.new
  end

  def create

    @order_payjp = OrderPayjp.new(order_params)
  #  binding.pry
    if @order_payjp.valid?
       pay_item
       @order_payjp.save
       return redirect_to root_path
    else
      render 'index'
    end
  end
  private

  def order_params
    params.require(:order_payjp).permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number).merge(user_id:current_user.id,item_id:params[:item_id],token: params[:token])
  end

  def set_order_payjp
    @order_item = Item.find(params[:item_id])
  end

  def pay_item
     Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
     Payjp::Charge.create(
      amount: @order_item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def order_current_user
   @item = Item.find(params[:item_id])
   if current_user.id == @item.user_id || @item.order.present?
   redirect_to root_path
   end
  end
end
