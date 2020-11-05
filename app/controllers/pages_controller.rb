class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home

  def home
    @places = Place.all.sample(6)
  end
end

# if params[:search][:query].present?
#   @places = Place.global_search(params[:search][:query])
# else
#   @places = Place.all.sample(6)
# end
# end