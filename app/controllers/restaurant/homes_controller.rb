class Restaurant::HomesController < ApplicationController

  def show
    @restaurant = current_restaurant
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:id, :name, :zipcode, :address, :phone_number, :home_page, :business_hours)
  end
end
