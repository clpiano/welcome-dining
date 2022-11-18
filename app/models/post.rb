class Post < ApplicationRecord
  has_one_attached :image

  belongs_to :restaurant
  has_one :reservation
  #バリデーション
  validates :content, presence: true

  #いいね機能
  has_many :favorites, dependent: :destroy

  def favorited?(customer)
    favorites.where(customer_id: customer.id).exists?
  end

end
