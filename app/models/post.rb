class Post < ApplicationRecord
  has_one_attached :image

  belongs_to :restaurant
  has_one :reservation
  #バリデーション
  validates :content, presence: true
  validates :reservation_status, presence: true

  #いいね機能
  has_many :favorites, dependent: :destroy

  def favorited?(customer)
    favorites.where(customer_id: customer.id).exists?
  end
  #通知機能いらないかも
  has_many :notifications, dependent: :destroy
end
