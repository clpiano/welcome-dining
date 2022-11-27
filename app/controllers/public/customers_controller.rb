class Public::CustomersController < ApplicationController
  before_action :authenticate_customer!
  #ゲストの場合、編集画面にいこうとするとトップ画面へ遷移
  before_action :ensure_guest_customer, only: [:edit]

  #お気に入り一覧
  def favorites
    favorites = Favorite.where(customer_id: current_customer.id).pluck(:post_id)
    @posts = Post.where(id: favorites).order(updated_at: :desc).page(params[:page]).per(10)
  end
  #マイページ
  def show
    @customer = current_customer
  end
  #編集画面
  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to my_page_path
  end
  #アカウント削除確認画面
  def unsubscribe
  end

  def destroy
    current_customer.destroy
    redirect_to root_path
  end

  private

  def customer_params
    params.require(:customer).permit(:id, :name, :kana_name, :zipcode, :address, :phone_number, :email, :password)
  end

  def ensure_guest_customer
    if current_customer.email == 'guest@example.com'
      redirect_to my_page_path, alert: "ゲストユーザーはこの機能は使えません"
    end
  end
end
