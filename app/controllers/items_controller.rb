class ItemsController < ApplicationController
  def index
  end

  def new
    @items = Item.new
  end

  def create
    
  end

  private

  # def item_params
  #   params.require(:item).permit(:item, :detail, :image).merge(user_id: current_user.id)
  # end
end
