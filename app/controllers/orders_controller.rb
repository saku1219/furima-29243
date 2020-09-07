class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new
  end
  
  def create
    @item = Item.find(params[:item_id])
    @current_user = current_user.id
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save(@item, @current_user)
      redirect_to root_path
    else
      render "orders/index"
    end
  end

  private

  def order_params
    params.permit(:token, :postal_code, :prefecture_id, :city, :house_number, :building_name, :tell)
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency:'jpy'
    )
  end
end
