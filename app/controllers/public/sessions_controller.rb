# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController

  def guest_sign_in
    customer = Customer.find_or_create_by!(email: 'guest@example.com') do |customer|
      customer.password = SecureRandom.urlsafe_base64
      customer.name = "ゲスト"
      customer.kana_name = "ゲスト"
      customer.zipcode = 9999999
      customer.address = "○○県○○市"
      customer.phone_number = 11122223333
    end
    sign_in customer
    redirect_to posts_path, notice: 'ゲストユーザーとしてログイン'
  end
  # before_action :configure_sign_in_params, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
