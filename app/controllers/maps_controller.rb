class MapsController < ApplicationController


  def index
    @map = map.all
  end

  def new
    @map = Map.new
  end
  
    def create

    @map = Map.new(map_params)
    if @map.save
      redirect_to  item_map_path(params[:item_id],@map[:id])
    else
      render :new
    end
  end 
  
  def show
    @map = Map.find(params[:item_id])
    gon.map = @map
  end
  
  def edit
    @map = Map.find(params[:item_id])
  end

  def update
    if @map.update(params[:id])
      redirect_to item_map_path
    else
      render :edit
    end
  end

  private
  
  def map_params
    params.require(:map).permit(:address,:latitude, :longitude).merge(item_id: params[:item_id], user_id: current_user.id)
  end

 

  end