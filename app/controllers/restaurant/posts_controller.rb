class Restaurant::PostsController < ApplicationController
  #新規投稿画面
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.restaurant_id = current_restaurant.id
    @post.save
    redirect_to restaurant_post_path(@post)
  end
  #投稿一覧画面
  def index
    @posts = Post.all
    @posts = Post.all.order(created_at: :desc)
  end
  #投稿詳細画面
  def show
    @post = Post.find(params[:id])
  end
  #投稿編集画面
  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.restaurant_id = current_restaurant.id
    @post.update(post_params)
    redirect_to restaurant_post_path(@post)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.restaurant_id = current_restaurant.id
    @post.destroy
    redirect_to restaurant_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content, :home_page, :image, :category, :reservation_status)
  end
end
