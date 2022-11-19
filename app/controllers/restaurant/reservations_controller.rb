class Restaurant::ReservationsController < ApplicationController
  #予約一覧
  def index
    @reservations = current_restaurant.reservations.all.order(created_at: :desc).page(params[:page]).per(20)
  end
  #予約詳細
  def show
    @reservation = current_restaurant.reservations.find(params[:id])
  end

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
