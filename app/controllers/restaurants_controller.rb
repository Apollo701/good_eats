class RestaurantsController < ApplicationController
  skip_before_action :require_login, only: [:index, :create]

  def index
    @restaurant = Restaurant.new
    @results = params[:results] || []
  end

  def create
    if location.match location_regex
      flash[:success] = "Your delicious 10 results around #{location}"
      redirect_to root_path(results: Restaurant.search(location, term))
    else
      flash[:error] = 'Please enter an actual location'
      redirect_to root_path
    end
  end

  private

  def location_regex
    /\A[a-z]+\Z/i
  end

  def location
    restaurant_params[:location]
  end

  def term
    restaurant_params[:term]
  end

  def restaurant_params
    params.require(:restaurant).permit(:location, :term)
  end
end
