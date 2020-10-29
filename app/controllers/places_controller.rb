class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    @places = Place.all
  end

  def show
    @place = place.find(params[:id])
  end

  def new
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.save

    redirect_to place_path(@place)
  end

  def edit
    # @place = place.find(params[:id])
  end

  def update
    # @place = place.find(params[:id]) # before_action
    @place.update(place_params)
    redirect_to place_path(@place)
  end

  def destroy
    # @place = place.find(params[:id])
    @place.destroy
    redirect_to places_path
  end

  private

  def set_place
    @place = Place.find(params[:id])
  end

  def place_params
    params.require(:place).permit(:name, :address, :rating)
  end
end