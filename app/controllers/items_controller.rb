class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :correct_user, only: [:edit, :update]

  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to action: :show
    else
      @item = Item.find(params[:id])
      render :edit
    end
  end
  private

  def item_params
    params.require(:item).permit(:image, :title, :description, :price, :category_id, :status_id, :shopping_cost_id, :prefecture_id,
                                 :shopping_day_id).merge(user_id: current_user.id)
  end

  def correct_user
    item = Item.find(params[:id])
    redirect_to root_path unless item.user == current_user
  end
end