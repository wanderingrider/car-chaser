class MapsController < ApplicationController
  before_action :set_map, only: [:show, :edit, :update, :destroy ]

  def index
    @map = map.all
  end

  def new
    @map = Map.new
  end

  def create
    @map = Map.new(map_params)
    if @map.save
      redirect_to item_map_path(params[:item_id], @map[:id])
    else
      render :new
    end
  end

  def show
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
    @map.update(map_id = nil )
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
