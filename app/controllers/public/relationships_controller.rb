class Public::RelationshipsController < ApplicationController
  #フォローするとき
  def create
    current_customer.follow(params[:restaurant_id])
    redirect_to request.referer
  end
  #フォロー外すとき
  def destroy
    current_customer.unfollow(params[:restaurant_id])
    redirect_to request.referer
  end  
  #フォロー
  def followings
    restaurant = Restaurant.find(params[:restaurant_id])
    @restaurants = restaurants.followings
  end
end
