class Restaurant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  #バリデーション
  validates :name, presence: true
  validates :genre, presence: true
  validates :zipcode, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :start_time, presence: true
  validates :finish_time, presence: true
  
  has_many :posts, dependent: :destroy
  has_many :reservations
  #会員にフォローされる
  has_many :reverse_of_relationships, class_name: "Relationships", foreign_key: "followed_id", dependent: :destroy
  #一覧画面
  has_many :followers, through: :reverse_of_relationships, source: :follower
  #通知機能
  has_many :passive_notifications, class_name: 'Notification', foreign_key: 'visited_id', dependent: :destroy
end
