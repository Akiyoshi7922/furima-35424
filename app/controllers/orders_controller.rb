class OrdersController < ApplicationController
  before_action :set_order_payjp, only: [:index, :create]
  def index
    @order_payjp = OrderPayjp.new
  end

  def create
      # binding.pry
    @order_payjp = OrderPayjp.new(order_params)
    if @order_payjp.valid?
       @order_payjp.save
       return redirect_to root_path
    else
      render 'index'
    end
  end
  private

  def order_params
    params.require(:order_payjp).permit(:postal_code, :prefecture_id, :city, :address, :house_number, :building_name, :phone_number).merge(user_id:current_user.id,item_id:params[:id])
  end

  def set_order_payjp
    @order_item = Item.find(params[:item_id])
  end
end
