class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_item, only: [:edit, :update, :show]
  before_action :ensure_current_user, only: [:edit, :update]
 def index
  @items = Item.includes(:user).order("created_at DESC")
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

 def show
 end

 def edit
 end

 def update
  if @item.update(item_params)
    redirect_to item_path
  else
    render :edit
  end
 end

#  def destroy
#  end
 private
 def item_params
   params.require(:item).permit(:image, :product_name, :product_description, :category_id, :product_status_id, :shipping_id, :prefecture_id, :shipping_day_id, :price).merge(user_id: current_user.id)
 end

 def ensure_current_user
  item = Item.find(params[:id])
  if item.user_id != current_user.id
    redirect_to action: :index
  end
 end
 def set_item
  @item = Item.find(params[:id])
 end
end
