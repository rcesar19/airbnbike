class PagesController < ApplicationController

  skip_before_action :authenticate_user!, only: :home

  def home
    @places = Place.all.sample(12)
  end



end
