class Public::PostsController < ApplicationController
  before_action :authenticate_customer!
  #検索用
  before_action :set_search

  #会員用投稿一覧
  def index
    @posts = Post.all.order(updated_at: :desc).page(params[:page]).per(20)
  end
  #会員用詳細ページ
  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:content, :home_page, :image, :category, :reservation_status)
  end
  #ジャンル検索
  def set_search
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order(updated_at: :desc).page(params[:page]).per(20)
  end
end
