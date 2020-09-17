class OrdersController < ApplicationController
  before_action :move_to_index

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      binding.pry
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:order_address, :token, :item_id, :user_id, :postal, :prefect_id, :city, :address, :building, :tel, :price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end

  def move_to_index
    redirect_to new_user_session_path unless user_signed_in?
  end
end

