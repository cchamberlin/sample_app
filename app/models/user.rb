class User < ActiveRecord::Base
  has_secure_password
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  
  before_save { email.downcase! }
  
  validates :email, presence: true, uniqueness: { case_sensitive: false }, length: { maximum: 255 }, format: { with: VALID_EMAIL_REGEX }
  validates :password, length: { minimum: 6 }
  validates :name, presence: true, length: { maximum: 50 }
end
