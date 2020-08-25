class OrdersController < ApplicationController
  
  def new
    @item = Item.find(params[:item_id])
    @orders = AddressOrder.new
  end

  def create
    @orders = AddressOrder.new(orders_params) 
    @orders.save

    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'new'
    end
  end


  private

  def order_params
    binding.pry
    params.permit(:token)
  end

  def orders_params
    #「住所」のキーも追加
    params.require(:address_order).permit(:postal_code, :Prefectures_id, :address, :city, :building_name, :phone_number)
  end

  def pay_item
    Payjp.api_key = "sk_test_XXXXXXXX"  # PAY.JPテスト秘密鍵
    Payjp::Charge.create(
      amount: order_params[:price],  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency:'jpy'                 # 通貨の種類(日本円)
    )
  end

end
