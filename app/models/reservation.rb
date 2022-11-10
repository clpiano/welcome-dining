class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :restaurant
  #予約の承認ステータス
  enum approval_status: { unapproved: 0, approved: 1, impossible: 2, visited: 3 }
end
