class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :reservations, dependent: :destroy
  #いいね機能
  has_many :favorites, dependent: :destroy

  #フォロー機能(フォローした側)
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  #一覧画面
  has_many :followings, through: :relationships, source: :followed

  #フォローしたときの処理
  def follow(restaurant_id)
    relationships.create(followed_id: restaurant_id)
  end
  #フォロー外すときの処理
  def unfollow(restaurant_id)
    relationships.find_by(followed_id: restaurant_id).destroy
  end
  #フォローしているか判定
  def following?(restaurant)
    followings.include?(restaurant)
  end
  #通知機能
  has_many :active_notifications, class_name: 'Notification', foreign_key: 'visitor_id', dependent: :destroy
  #has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
end
