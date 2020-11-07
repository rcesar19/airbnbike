class DashboardController < ApplicationController
  def index
    @bookings = Booking.all
    @places = Place.all
  end
end
