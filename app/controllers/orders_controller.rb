class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create, :correct_user]
  before_action :correct_user, only: [:index, :create]
  before_action :sold_out_user, only: [:index,:create]

  def index
    @order_address = OrderAddress.new
  end

  def create
    @order_address = OrderAddress.new(address_params)

    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def address_params
    params.require(:order_address).permit(:phone_number, :postal_code, :prefecture_id, :city, :block, :build).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: address_params[:token],
      currency: 'jpy'
    )
  end

  def correct_user
    redirect_to root_path if current_user.id == @item.user.id
  end

  def sold_out_user
    redirect_to root_path unless @item.order.nil?
  end
end
