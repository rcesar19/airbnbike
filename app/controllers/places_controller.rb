class PlacesController < ApplicationController
  before_action :set_place, only: [:show, :edit, :update, :destroy]

  def index
    skip_authorization
    # @places = Place.all
    # @places = policy_scope(Place)
    if params[:query].present?
      @places = policy_scope(Place).global_search(params[:query])
    else
      @places = policy_scope(Place).all
    end
  end

  def show
    @markers = 
      [{
        lat: @place.latitude,
        lng: @place.longitude
      }]
  end

  def new
    @place = Place.new
    authorize @place
  end

  def create
    @place = Place.new(place_params)
    @place.user_id = current_user.id
    authorize @place

    if @place.save
      redirect_to place_path(@place)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @place.update(place_params)
    redirect_to place_path(@place)
  end

  def destroy
    @place.destroy
    redirect_to places_path
  end

  private

  def set_place
    @place = Place.find(params[:id])
    authorize @place
  end

  def place_params
    params.require(:place).permit(:name, :address, :description, :price, photos:[])
  end
end
