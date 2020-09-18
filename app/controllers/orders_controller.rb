class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :move_to_index

  def index
    @order = OrderAddress.new
    redirect_to root_path if current_user.id == @item.user_id
  end

  def create
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:item_id, :user_id, :postal, :prefect_id, :city, :address, :building, :tel, :price).merge(item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end
