class Reservation < ApplicationRecord
  belongs_to :customer
  belongs_to :restaurant
  belongs_to :post
end
