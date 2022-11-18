class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :restaurant
  #予約の承認ステータス
  enum approval_status: { unapproved: 0, approved: 1, impossible: 2, visited: 3 }
  #バリデーション
  validates :number_of_people, presence: true
  validates :reservation_time, presence: true
  validate :start_check, on: :create#会員側で予約するときのみ

  #現在より遅い時間に設定させる
  def start_check
    errors.add(:reservation_time, "は現在の日時より遅い時間を選択してください") if self.reservation_time < Time.now
  end

  #通知機能
  has_many :notifications, dependent: :destroy
  #会員側で予約リクエストを送った時
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

  #飲食店側から承認を送ったとき

end