class Public::PostsController < ApplicationController
  before_action :authenticate_customer!
  #検索用
  before_action :set_search

  #投稿一覧
  def index
    @posts = Post.all.order(updated_at: :desc).page(params[:page]).per(20)
  end
  #投稿詳細
  def show
    @post = Post.find_by(id: params[:id])
    #投稿が見つからない場合
    if @post.nil?
      redirect_to posts_path
    else
      "show"
    end
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
