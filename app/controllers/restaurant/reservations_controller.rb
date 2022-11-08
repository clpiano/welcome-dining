class Restaurant::ReservationsController < ApplicationController

  def index
    @reservations = current_restaurant.reservations.all
  end

  def show
    @reservation = current_restaurant.reservations.find_by(params[:id], restaurant_id: current_restaurant)
  end
end
