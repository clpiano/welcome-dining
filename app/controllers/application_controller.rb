class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  #ログイン後
  def after_sign_in_path_for(resource)
    case resource
    #飲食店の場合、予約一覧へ
    when Restaurant
      restaurant_reserve_path
    #会員の場合、トップ画面へ
    when Customer
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :kana_name, :zipcode, :address, :phone_number, :genre, :web_site, :start_time, :finish_time, :last_order, :regular_holiday])
  end
end
