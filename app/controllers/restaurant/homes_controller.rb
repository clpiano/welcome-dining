class Restaurant::HomesController < ApplicationController
  #マイページ
  def show
    @restaurant = current_restaurant
  end

end
