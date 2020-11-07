class DashboardController < ApplicationController
  def index
    @bookings = Booking.where(user_id: current_user.id)
    @places = Place.where(user_id: current_user.id)
  end
end
