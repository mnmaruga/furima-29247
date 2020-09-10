class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :show, :update]
  before_action :move_to_index, except: [:index, :show]

  def index
    @items = Item.all.order(id: :DESC)
    @sale = Sale.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def show
    @sale = Sale.all
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to root_path
    else
      render 'edit'
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :item, :detail, :category_id, :status_id, :deli_fee_id, :area_id, :deli_day_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
