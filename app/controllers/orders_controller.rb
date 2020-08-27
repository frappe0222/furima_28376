class OrdersController < ApplicationController
  before_action :move_to_new, only: [:new]
  before_action :move_to_index, only: [:new]

  def new
    @item = Item.find(params[:item_id])
    @order = AddressOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = AddressOrder.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path(@item)
    else
      render 'new'
    end
  end


  private

  def order_params
    params.permit(:token,:postal_code, :prefecture_id, :address, :city, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: @item.price, # 決済する値段
      card: params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

  def move_to_new
    unless user_signed_in?
      redirect_to  new_user_session_path
    end
  end

  def move_to_index
    unless user_signed_in? && current_user.id == @item.user_id
      redirect_to root_path(@item)
    end
  end

end
