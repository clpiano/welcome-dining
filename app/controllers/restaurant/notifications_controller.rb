class Restaurant::NotificationsController < ApplicationController
  before_action :authenticate_restaurant!

  #飲食店側通知一覧
  def index
    @notifications = current_restaurant.passive_notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end
