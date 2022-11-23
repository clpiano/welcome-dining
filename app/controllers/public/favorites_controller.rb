class Public::FavoritesController < ApplicationController
  before_action :authenticate_customer!

  #いいね押す
  def create
    @post = Post.find(params[:post_id])
    @post_favorite = Favorite.new(customer_id: current_customer.id, post_id: params[:post_id])
    @post_favorite.save
  end
  #いいね外す
  def destroy
    @post = Post.find(params[:post_id])
    @post_favorite = Favorite.find_by(customer_id: current_customer.id, post_id: params[:post_id])
    @post_favorite.destroy
  end
end
