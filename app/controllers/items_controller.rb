class ItemsController < ApplicationController
  before_action :set_item, only: [ :edit,:show, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)

    if @item.save
      redirect_to new_item_map_path(@item.id)
    else
      render :new
    end
  end

  def show
    @comment = Comment.new
    @comments = @item.comments.includes(:user)
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:information_name, :description, :prefecture_id, :theft_place_id, :theft_day,
                                 :image).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index if @item.user.id != current_user.id
  end
end
