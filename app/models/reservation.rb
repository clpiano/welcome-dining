class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :restaurant
  #予約の承認ステータス
  enum approval_status: { unapproved: 0, approved: 1, impossible: 2, visited: 3 }
  #通知機能
  has_many :notifications, dependent: :destroy

  def create_notification_reservation(current_customer, reservation_id)
    temp = Notification.where(["visitor_id = ? and visited_id = ? and reservation_id = ? and action = ? ", current_customer.id, restaurant_id, id, 'reservation'])
    #temp_ids = Reservation.select(:customer_id).where(reservation_id: id).where.not(customer_id: current_customer.id).distinct
    #temp_ids.each do |temp_id|
      #save_notification_reserve(current_customer, reservation_id, temp_id['customer_id'])
    #end
    #save_notification_reserve(current_customer, reservation_id, restaurant_id) if temp_ids.blank?
  #end

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
