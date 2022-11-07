class Public::ReservationsController < ApplicationController

  def new
    #@customer = current_customer.id
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = Reservation.new
  end

  def create
    @reservation = Reservation.new(reservation_params)
    
    @reservation.customer_id = current_customer.id

    @reservation.save
    redirect_to restaurant_reservation_path(@reservation)
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def index
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def reservation_params
    params.require(:reservation).permit(:customer_id, :restaurant_id, :number_of_people, :reservation_time, :note)
  end
end
