class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.new(order_params)
    @order.save
    if @order.valid?
      pay_item
      # @order.save
      return redirect_to root_path
    else      
      # @order.save
      # binding.pry
      render 'index'
    end
  end

  private

  def order_params
    params.permit(:token,:item_id, :postal, :prefect_id, :city, :address, :building, :tel, :price)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],
      card: order_params[:token],
      currency:'jpy'
    )
  end
end

