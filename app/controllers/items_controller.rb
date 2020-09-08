class ItemsController < ApplicationController
before_action :move_to_index, except: [:index]

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to new_user_session_path
    else
      render "new"
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item, :detail, :category_id, :status_id, :deli_fee_id, :area_id, :deli_day_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end
