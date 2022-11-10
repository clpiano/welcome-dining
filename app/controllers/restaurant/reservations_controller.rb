class Restaurant::ReservationsController < ApplicationController

  def index
    @reservations = current_restaurant.reservations.all.order(reservation_time: "DESC")
    @reservations = current_restaurant.reservations.all.page(params[:page]).per(10)
  end

  def show
    @reservation = current_restaurant.reservations.find(params[:id])
  end

  #def edit
   # @reservation = current_restaurant.reservations.find(params[:id])
  #end

  def update
    @reservation = current_restaurant.reservations.find(params[:id])
    @reservation.approval_status = params[:approval_status]
    @reservation.update(reservation_params)
    redirect_to restaurant_reserve_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:restaurant_id, :customer_id, :number_of_people, :reservation_time, :approval_status)
  end
end
