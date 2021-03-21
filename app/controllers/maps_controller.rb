class MapsController < ApplicationController
    before_action :set_maps, only: [:create,:show]

  def new
    @map = Map.new
  end

  def create
    @map = Map.new(maps_params)
  
    if @map.save
      redirect_to item_path
    else
      render :new
    end
  end

  def show
      @map = Map.find(params[:id])
      gon.map = @map
  end

   private

   def maps_params
    params.require(:map).permit(:address, :latitude, :longitude).merge( user_id: current_user.id)
   end

  def set_maps
    @item = Item.find(params[:item_id])
   end
end