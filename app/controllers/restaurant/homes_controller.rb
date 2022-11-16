class Restaurant::HomesController < ApplicationController

  def show
    @restaurant = current_restaurant
  end

end
