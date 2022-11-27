class Public::ReservationsController < ApplicationController
  before_action :authenticate_customer!

  #新規予約
  def new
    @restaurant = Restaurant.find_by(id: params[:restaurant_id])
    if @restaurant.nil?
      redirect_to posts_path
    else
      @reservation = Reservation.new
    end
  end
  #予約作成
  def create
    @reservation = current_customer.reservations.new(reservation_params)
    if @reservation.save
      #通知機能
      @reservation.create_notification_reservation(current_customer, @reservation.id)
      redirect_to restaurant_reservation_path(@reservation.restaurant, @reservation)
    else
      @restaurant = Restaurant.find(params[:restaurant_id])
      render :new
    end
  end
  #予約詳細
  def show
    @reservation = current_customer.reservations.find_by(id: params[:id])
    #予約が見つからない場合、もしくは予約がログイン中の会員のものではない場合
    if @reservation.nil? || @reservation.customer != current_customer
      redirect_to reservations_path
    else
      "show"
    end
  end
  #予約一覧
  def index
    @reservations = current_customer.reservations.all.order(created_at: :desc).page(params[:page]).per(20)
  end
  #予約キャンセル
  def destroy
    @reservation = current_customer.reservations.find(params[:id])
    @reservation.destroy
    redirect_to reservations_path
  end

  private

  def reservation_params
    params.require(:reservation).permit(:customer_id, :restaurant_id, :number_of_people, :reservation_time, :note, :approval_status)
  end
end
