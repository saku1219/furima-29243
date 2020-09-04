class ItemsController < ApplicationController
  def index
    @item = Item.all
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

  private
  def item_params
    params.require(:item).permit(:name, :image, :price, :description, :category_id, :condition_id, :shipping_payer_id, :shipping_from_area_id, :shipping_duration_id).merge(user_id: current_user.id)
  end
end
