class BookingsController < ApplicationController

    before_action :set_booking, only: [:show, :edit, :update, :destroy]

  # GET http://localhost:3000/bookings
  def index
    @bookings = booking.all
  end

  # GET http://localhost:3000/bookings/1
  def show
    # @booking = booking.find(params[:id]) # before_action
  end

  # GET http://localhost:3000/bookings/1
  def new
    @booking = booking.new
  end

  # POST http://localhost:3000/bookings
  def create
    # params[:booking] => {"name"=>"teste", "address"=>"endereço", "rating"=>"10"}

    @booking = booking.new(booking_params)
    @booking.save

    redirect_to booking_path(@booking)
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
    @booking.destroy
    redirect_to bookings_path
  end

  private

  def set_booking
    @booking = booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:name, :address, :rating)
  end
end
