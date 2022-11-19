class Public::RestaurantsController < ApplicationController
  before_action :set_q, only: [:index, :search]
  #飲食店一覧
  def index
    @restaurants = Restaurant.all.page(params[:page]).per(20)
  end
  #飲食店詳細
  def show
    @restaurant = Restaurant.find(params[:id])
    @posts = @restaurant.posts.all.order(created_at: :desc).limit(10)
  end
  #検索結果
  def search
    @restaurants = @q.result.page(params[:page]).per(20)
  end

  private
  #キーワード検索
  def set_q
    @q = Restaurant.ransack(params[:q])
  end

end
