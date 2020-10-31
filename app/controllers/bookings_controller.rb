class BookingsController < ApplicationController

  before_action :set_place, only: [ :new, :create, :edit ]

  # GET http://localhost:3000/bookings
  # def index
  #   @bookings = Booking.all
  # end

  # GET http://localhost:3000/bookings/1
  # def show
  #   # @booking = booking.find(params[:id]) # before_action
  # end

  # GET http://localhost:3000/bookings/1
  def new
    @booking = Booking.new
  end

  # POST http://localhost:3000/bookings
  def create
    # params[:booking] => {"name"=>"teste", "address"=>"endereço", "rating"=>"10"}
    @booking = Booking.new(booking_params)
    @booking.user_id = current_user.id
    @booking.place_id = @place.id
    if @booking.save
      redirect_to booking_path(@booking)
    else
      render :new
    end
  end

  # GET http://localhost:3000/bookings/3/edit
  def edit
    # @booking = booking.find(params[:id]) # before_action
  end

  # PATCH http://localhost:3000/bookings/3
  def update
    # @booking = booking.find(params[:id]) # before_action
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  # DELETE http://localhost:3000/bookings/3
  def destroy
    # @booking = booking.find(params[:id]) # before_action
    @booking = Booking.find(params[:id])
    @place = @booking.place
    @booking.destroy
    redirect_to bookings_path(@place)
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def booking_params
    params.require(:booking).permit(:date)
  end
end
