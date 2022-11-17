class Restaurant::ReservationsController < ApplicationController

  def index
    @reservations = current_restaurant.reservations.all.order(created_at: :DESC)
    @reservation = current_restaurant.reservations.all.page(params[:page]).per(10)
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
    #通知機能
    @reservation.approved_notification_reservation(current_restaurant, @reservation_id, reservation_params[:approval_status])
    redirect_to restaurant_reserve_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:restaurant_id, :customer_id, :number_of_people, :reservation_time, :approval_status)
  end
end
