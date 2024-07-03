class RestaurantsController < ApplicationController
  before_action :find_restaurant, only: :show
  
  def index
    @restaurants = Restaurant.all
  end

  def show
    @reviews = Review.where(restaurant_id: @restaurant)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(strong_params)
    if @restaurant.save!
      redirect_to restaurant_path(@restaurant)
    else
      redirect_to restaurant_new_path
    end
  end

  private

  def find_restaurant
    @restaurant = Restaurant.find(params["id"])
  end

  def strong_params
    params.require(:restaurant).permit(:name, :address, :category)
  end
end
