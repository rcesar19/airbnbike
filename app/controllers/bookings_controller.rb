class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :accept, :decline]

  def show
    @booking = booking.find(params[:id]) # before_action
  end

  # GET http://localhost:3000/bookings/1
  def new
    # book particular flat by booking's flat_id
    @place = Place.find(params[:place_id])
    @booking = Booking.new
    authorize @booking
  end

  # POST http://localhost:3000/bookings

  def create
    # filled in form
    @place = Place.find(params[:place_id])
    @booking = Booking.new
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
      render :show
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

  def booking_params
    params.require(:booking).permit(:confirmed, :place_id, :date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
