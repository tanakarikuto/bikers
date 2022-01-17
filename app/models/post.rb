class Post < ApplicationRecord
  belongs_to :user
  belongs_to :post
  belongs_to :room
  has_many :comments
end