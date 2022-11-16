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
  #フォロー一覧
  def followings
    @restaurants = current_customer.followings.page(params[:page]).per(20)
  end
end
