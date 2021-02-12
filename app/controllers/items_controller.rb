class ItemsController < ApplicationController
  before_action :authenticate_user!,{only: [:new]}
  
  def index
  end
  def new
  end

  private

  def item_params
    params.require(:item).permit(:title,:description,:price,:image).merge(user_id: currents_user.id)
  end
end
