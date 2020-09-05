class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]

  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def update
    @item = Item.find(params[:id])
    if @item.update(item_update_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    redirect_to root_path
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :price, :description, :category_id, :condition_id, :shipping_payer_id, :shipping_from_area_id, :shipping_duration_id).merge(user_id: current_user.id)
  end

  def item_update_params
    params.require(:item).permit(:name, :image, :price, :description, :category_id, :condition_id, :shipping_payer_id, :shipping_from_area_id, :shipping_duration_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
