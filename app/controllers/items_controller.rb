class ItemsController < ApplicationController

  def index
    #@items = Item.all
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :index
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:image,:price,:text,:category_id,:status_id,:delivery_burden_id,:shipping_area_id,:estimated_shipping_id ).merge(user_id: current_user.id)
  end

end
