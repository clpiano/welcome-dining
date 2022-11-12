class Public::FavoritesController < ApplicationController

  def create
    @post_favorite = Favorite.new(customer_id: current_customer.id, post_id: params[:post_id])
    @post_favorite.save
    redirect_back fallback_location: root_path
  end

  def destroy
    @post_favorite = Favorite.find_by(customer_id: current_customer.id, post_id: params[:post_id])
    @post_favorite.destroy
    redirect_back fallback_location: root_path
  end
end
