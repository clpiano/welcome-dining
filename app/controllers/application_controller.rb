class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Restaurant
      restaurant_reserve_path#(仮)
    when Customer
      posts_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :kana_name, :zipcode, :address, :phone_number, :genre, :web_site, :start_time, :finish_time, :last_order, :regular_holiday])
  end
end
