class Notification < ApplicationRecord
  default_scope -> { order(created_at: :desc) }
  belongs_to :reservation, optional: true
  #通知送る側(会員)
  belongs_to :visitor, class_name: 'Customer', foreign_key: 'visitor_id', optional: true
  #通知受け取る側(飲食店)
  belongs_to :visited, class_name: 'Restaurant', foreign_key: 'visited_id', optional: true
end
