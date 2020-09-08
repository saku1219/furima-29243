class OrdersController < ApplicationController
  before_action :set_order
  before_action :move_to_index
  def index
    @order = OrderAddress.new
  end
  
  def create
    @current_user = current_user.id
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save(@item, @current_user)
      redirect_to root_path
    else
      render :index
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

  def set_order
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    order = Order.find_by item_id: @item.id
    if !order.nil? || !user_signed_in? || current_user.id == @item.user_id
      redirect_to "/items"
    end
  end
end
