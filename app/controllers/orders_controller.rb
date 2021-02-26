class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order = Order.new
  end

  def create
    # binding.pry
    @order = Order.new(order_params)
    if @order.vaild?
      # Payjp.api_key =""
      # Payjp::Charge.create(
      #   card: order_params[:token],
      #   currency: 'jpy'
      # )
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order).permit(:phone_number, :postal_code, :prefecture_id, :city, :block, :build).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
