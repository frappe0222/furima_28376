class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def create
    Item.create(item_params)

    if @item.save
      redirect_to root_path(@item)
    else
      render ：/items/new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:image,:price,:text,:category_id,:status_id,:delivery_burden_id,:shipping_area_id,:estimated_shipping_id ).merge(user_id: current_user.id)
  end

end
