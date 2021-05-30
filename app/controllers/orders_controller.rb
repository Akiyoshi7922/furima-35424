class OrdersController < ApplicationController
  before_action :set_order_addres, only: [:index, :create]
  def index
    @order_addres = OrderAddres.new
  end

  def create
    #  binding.pry
    @order_addres = OrderAddres.new(order_params)
    if @order_addres.valid?
       @order_addres.save
       return redirect_to root_path
    else
      render 'index'
    end
  end
  private

  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building_name, :phone_number)
  end

  def set_order_addres
    @order_item = Item.find(params[:item_id])
  end
end
