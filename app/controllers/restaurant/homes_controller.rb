class Restaurant::HomesController < ApplicationController
  before_action :authenticate_restaurant!

  #マイページ
  def show
    @restaurant = current_restaurant
  end
  #諸注意
  def attention
  end
end
