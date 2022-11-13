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
    customer = current_customer
    @restaurants = customer.followings
  end
end
