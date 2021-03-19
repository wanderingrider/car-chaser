class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update]
  
  def index
    @item = Item.order('created_at DESC').limit(6).offset(1)
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
  end


  private

  def item_params
    params.require(:item).permit(:information_name, :description, :prefecture_id, :theft_place_id, :theft_day, :image).merge(user_id: current_user.id)
  end

end

