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
    # filled in form
    @place = Place.find(params[:place_id])
    @booking = Booking.new(booking_params)
    # logged_in user assign
    @booking.user = current_user
    @booking.place = @place
    @booking.confirmed = nil
    # authorization of booking
    authorize @booking
    if @booking.save
      # redirect_to to-all-bookings/dashboard
      redirect_to places_path
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

  def accept
    @booking = Booking.find(params[:id])
    @booking.confirmed = true
    @booking.save
    redirect_to booking_path(@booking)
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.confirmed = false
    @booking.save
    redirect_to booking_path(@booking)
  end

  private

  def set_place
    @place = Place.find(params[:place_id])
  end

  def booking_params
    params.require(:booking).permit(:date)
  end
end
