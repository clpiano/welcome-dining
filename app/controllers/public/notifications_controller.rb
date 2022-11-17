class Public::NotificationsController < ApplicationController
  #会員側通知一覧
  def index
    @notifications = current_customer.active_notifications.page(params[:page]).per(20)
    @notifications.where(checked: false).each do |notification|
      notification.update(checked: true)
    end
  end
end
