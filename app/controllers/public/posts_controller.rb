class Public::PostsController < ApplicationController

  def index
    @posts = Post.all
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(post_params)
  end

  private

  def post_params
    params.require(:post).permit(:content, :home_page, :image, :category, :reservation_status)
  end
end
