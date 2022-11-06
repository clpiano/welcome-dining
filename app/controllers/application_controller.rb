class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    case resource
    when Restaurant
      new_restaurant_post_path#(仮)
    when Customer
      root_path
    end
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :last_name, :first_name, :zipcode, :address, :phone_number, :home_page, :business_hours, :last_order, :regular_holiday])
  end
end
