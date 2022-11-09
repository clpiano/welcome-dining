class Public::ReservationsController < ApplicationController

  def new
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = current_customer.reservations.new(reservation_params)
    @reservation.save
    redirect_to restaurant_reservation_path(@reservation.restaurant, @reservation)
  end

  def show
    @reservation = current_customer.reservations.find(params[:id])
  end

  def index
    @reservations = current_customer.reservations.all
  end

  def edit
  end

  def update
  end

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
