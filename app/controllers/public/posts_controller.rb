class Public::PostsController < ApplicationController
  #会員用投稿一覧
  def index
    @posts = Post.all
    @posts = Post.all.order(created_at: :desc)
  end
  #会員用詳細ページ
  def show
    @post = Post.find(params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:content, :home_page, :image, :category, :reservation_status)
  end
end
