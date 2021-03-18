class ItemsController < ApplicationController
  def index
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

