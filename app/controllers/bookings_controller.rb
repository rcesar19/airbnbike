class BookingsController < ApplicationController

  before_action :set_booking, only: [:show, :accept, :decline]


  def index
    @bookings = Booking.all
    @places = Place.all
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @place = Place.find(params[:place_id])
    @booking = Booking.new
    authorize @booking
  end

  def create
    @place = Place.find(params[:place_id])
    @booking = Booking.new
    @booking.user = current_user
    @booking.place = @place
    @booking.date = Date.new(params[:booking][:"date(1i)"].to_i, params[:booking][:"date(2i)"].to_i, params[:booking][:"date(3i)"].to_i)
    @booking.confirmed = nil
    authorize @booking

    if @booking.save
      redirect_to dashboard_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @booking.update(booking_params)
    redirect_to booking_path(@booking)
  end

  def destroy
    @booking = Booking.find(params[:id])
    @place = @booking.place
    @booking.destroy
    redirect_to bookings_path(@place)
  end

  def accept
    authorize @booking
    @booking.update(confirmed: true)
    if @booking.save
      redirect_to dashboard_path, notice: "You have accepted booking of place # #{@booking.place.name}"
    end
  end

  def decline
    authorize @booking
    @booking.update(confirmed: false)
    if @booking.save
      redirect_to dashboard_path, alert: "You have declined booking of flat # #{@booking.place.name}"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:confirmed, :place_id, :date)
  end

  def set_booking
    @booking = Booking.find(params[:id])
  end
end
