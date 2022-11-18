class Public::CustomersController < ApplicationController
  #いいね一覧
  def favorites
    favorites = Favorite.where(customer_id: current_customer.id).pluck(:post_id)
    @posts = Post.find(favorites)
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

  private

  def customer_params
    params.require(:customer).permit(:id, :name, :kana_name, :zipcode, :address, :phone_number, :email, :password)
  end
end
