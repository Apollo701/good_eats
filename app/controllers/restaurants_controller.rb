class RestaurantsController < ApplicationController
  skip_before_action :require_login, only: [:index, :create]

  def index
    @results = params[:results] || []
  end

  def create
    redirect_to root_path(results: Restaurant.search(location, term))
  end

  private

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
