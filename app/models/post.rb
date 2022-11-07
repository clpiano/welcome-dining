class Post < ApplicationRecord
  has_one_attached :image

  belongs_to :restaurant
  has_one :reservation
end
