class MapsController < ApplicationController
  before_action :set_map, only: [:edit, :update]

  def index
    @map = Map.joins(:items)
    gon.map = @map
  end

  def new
    @map = Map.joins(:item).select('item_id')
    @map = Map.new
  end

  def create
    ActiveRecord::Base.transaction do
    @map = Map.joins(:items)
    @map = Map.new(map_params)
    if @map.valid?
      @map.save
      redirect_to item_map_path(params[:item_id], @map[:id])
    else
      render :new
    end
  end
  end

  def show
    @item = Item.find(params[:id])
    @map = Item.joins(:maps)
    @map = Map.find(@item.id)
    gon.map = @map
  end

  def edit
  end

  def update
    if @map.update(map_params)
      redirect_to item_map_path
    else
      render :edit
    end
  end

  def destroy
    @map = Map.joins(:item)
    @map = Map.find(params[:item_id], [:map_id])
    @map.destroy
    redirect_to root_path
  end

  private

  def set_map
    @map = Map.find(params[:item_id])
  end

  def map_params
    params.require(:map).permit(:address, :latitude, :longitude).merge(item_id: params[:item_id], user_id: current_user.id)
  end
end
