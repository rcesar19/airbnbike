class PlacesController < ApplicationController
  # before_action :set_place, only: [:show, :edit, :update, :destroy]

  # GET http://localhost:3000/places
  def index
    @places = Place.all
  end

  # GET http://localhost:3000/places/1
  def show
    # @place = place.find(params[:id]) # before_action
  end

  # GET http://localhost:3000/places/1
  def new
    @place = Place.new
  end

  # POST http://localhost:3000/places
  def create
    # params[:place] => {"name"=>"teste", "address"=>"endereço", "rating"=>"10"}

    @place = Place.new(place_params)
    @place.save

    redirect_to place_path(@place)
  end

  # GET http://localhost:3000/places/3/edit
  def edit
    # @place = place.find(params[:id]) # before_action
  end

  # PATCH http://localhost:3000/places/3
  def update
    # @place = place.find(params[:id]) # before_action
    @place.update(place_params)
    redirect_to place_path(@place)
  end

  # DELETE http://localhost:3000/places/3
  def destroy
    # @place = place.find(params[:id]) # before_action
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
