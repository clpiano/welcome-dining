class Restaurant::PostsController < ApplicationController
  before_action :authenticate_restaurant!

  #新規投稿画面
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.restaurant_id = current_restaurant.id
    if @post.save
      redirect_to restaurant_post_path(@post)
    else
      render :new
    end
  end
  #投稿一覧画面
  def index
    @posts = current_restaurant.posts.all.order(updated_at: :desc).page(params[:page]).per(20)
  end
  #投稿詳細画面
  def show
    @post = Post.find_by(id: params[:id])
    #投稿が見つからない場合、もしくは投稿がログイン中の飲食店のものではない場合
    if @post.nil? || @post.restaurant != current_restaurant
      redirect_to restaurant_posts_path
    else
      render "show"
    end
  end
  #投稿編集画面
  def edit
    @post = Post.find_by(id: params[:id])
    #投稿が見つからなかった場合、もしくは投稿がログイン中の飲食店のものではない場合
    if @post.nil? || @post.restaurant != current_restaurant
      redirect_to restaurant_posts_path
    else
      render "edit"
    end
  end

  def update
    @post = Post.find(params[:id])
    @post.restaurant_id = current_restaurant.id
    if @post.update(post_params)
      redirect_to restaurant_post_path(@post)
    else
      render "edit"
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.restaurant_id = current_restaurant.id
    @post.destroy
    redirect_to restaurant_posts_path
  end
  #投稿全て削除
  def destroy_all
    @posts = current_restaurant.posts.all
    @posts.destroy_all
    redirect_to restaurant_posts_path
  end

  private

  def post_params
    params.require(:post).permit(:restaurant_id, :content, :link, :image, :reservation_status)
  end
end
