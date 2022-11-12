class Restaurant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :image
  
  has_many :posts, dependent: :destroy
  has_many :reservations
  #会員にフォローされる
  has_many :customers, dependent: :destroy
end
