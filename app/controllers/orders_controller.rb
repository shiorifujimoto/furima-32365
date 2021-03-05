class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(address_params)
    
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
      # Payjp.api_key =""
      # Payjp::Charge.create(
      #   card: order_params[:token],
      #   currency: 'jpy'
      # ) 
    else
      render 'index'
    end
  end

  private

  def address_params
    params.require(:order_address).permit(:phone_number, :postal_code, :prefecture_id, :city, :block, :build).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
