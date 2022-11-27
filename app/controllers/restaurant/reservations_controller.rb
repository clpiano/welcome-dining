class Restaurant::ReservationsController < ApplicationController
  before_action :authenticate_restaurant!

  #予約一覧
  def index
    @reservations = current_restaurant.reservations.all.order(created_at: :desc).page(params[:page]).per(20)
  end
  #予約詳細
  def show
    @reservation = current_restaurant.reservations.find_by(id: params[:id])
    #予約が見つからない場合、もしくは予約がログイン中の飲食店のものではない場合
    if @reservation.nil? || @reservation.restaurant != current_restaurant
      redirect_to restaurant_reserve_path
    else
      render "show"
    end
  end
  #承認ステータスの更新
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
