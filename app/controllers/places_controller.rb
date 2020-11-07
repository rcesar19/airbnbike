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
    @booking = Booking.new
    @markers = 
      [{
        lat: @place.latitude,
        lng: @place.longitude
      }]
  end

  # def accept
  #   raise
  #   @place = Place.find(params[:place_id])
  #   if @place.user_id == current_user.id
  #     @booking.confirmed = true
  #     authorize @booking
  #     # owner's dashboard
  #     redirect_to dashboard_path, notice: "You have accepted booking of place # #{@place.name}"
  #   end
  # end

  # def decline
  #   @place = Place.find(params[:flat_id])
  #   if @place.user_id == current_user.id
  #     @booking.confirmed = false
  #     authorize @booking
  #     redirect_to dashboard_path, alert: "You have declined booking of flat # #{@place.name}"
  #   end
  # end

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
