class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end
  
  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render :show
    end
  end

  private

  def order_params
    params.permit(:token).merge(user_id: current_user.id, item_id: @item.id)
  end
  
  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency:'jpy'
    )
  end
end
