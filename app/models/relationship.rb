class Relationship < ApplicationRecord
  #フォローする側
  belongs_to :follower, class_name: "Customer"
  #フォローされる側
  belongs_to :followed, class_name: "Restaurant"
end
