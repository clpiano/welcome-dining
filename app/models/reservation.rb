class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :restaurant
  #予約の承認ステータス
  enum approval_status: { unapproved: 0, approved: 1, impossible: 2, visited: 3 }
  #通知機能
  has_many :notifications, dependent: :destroy

  def create_notification_reservation(current_customer, reservation_id)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and reservation_id = ? and action = ? ", current_customer.id, restaurant_id, reservation_id, 'reservation'])

    if temp.blank?
      notification = current_customer.active_notifications.new(
        reservation_id: id,
        visited_id: restaurant_id,
        action: 'reservation'
        )

      notification.save if notification.valid?
    end
  end
end
