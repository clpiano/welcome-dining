#いらないかも
module Restaurant::NotificationsHelper

  def notification_form(notification)
    @reservation = nil
     visitor = notification.visitor.name
    #your_reservation = link_to '予約', notification.reservation, style:"font-weight: bold;", remote: true
    case notification.action
      when "reservation" then

        "#{visitor}が予約リクエストを送信しました"
    end
  end
  #未確認
  def unchecked_notifications
    @notifications = current_restaurant.passive_notificaions.where(checked: false)
  end  
end
