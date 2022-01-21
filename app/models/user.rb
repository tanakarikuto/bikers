class User < ApplicationRecord
  
  validates :name, {presence: true, length: {maximum:15, minimum:1}}
  
  validates :email, {presence: true}
  validates :email, format: { with:  URI::MailTo::EMAIL_REGEXP}
  
  has_secure_password
  
  has_many :comments
  has_many :posts
  
  mount_uploader :image, ImageUploader
end
