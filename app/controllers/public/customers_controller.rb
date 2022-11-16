class Public::CustomersController < ApplicationController
  #before_action :set_customer, only: [:favorites]

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    @customer.update(customer_params)
    redirect_to my_page_path
  end

  def favorites
    favorites = Favorite.where(customer_id: current_customer.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  private

  def customer_params
    params.require(:customer).permit(:id, :last_name, :first_name, :zipcode, :address, :phone_number, :email, :password)
  end

  #def set_customer
    #@customer = Customer.find(params[:id])
  #end
end
