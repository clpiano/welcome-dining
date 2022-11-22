class Public::NotificationsController < ApplicationController
  before_action :authenticate_customer!

  #会員側通知一覧
  def index
    @notifications = current_customer.active_notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
  #通知
  def destroy
    @notification = Notification.find(params[:id])
    @notification.destroy
    redirect_to restaurant_reservation_path(@notification.visited, @notification.reservation)
  end
end
