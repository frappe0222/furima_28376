class ItemsController < ApplicationController
  before_action :move_to_sign_up, only: [:new]

  def index
    #@items = Item.all
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name,:image,:price,:text,:category_id,:status_id,:delivery_burden_id,:shipping_area_id,:estimated_shipping_id ).merge(user_id: current_user.id)
  end

  def move_to_sign_up
    unless user_signed_in?
      redirect_to new_user_session_path, notice: 'ログインが必要です'
    end
  end

end
