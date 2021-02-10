class User < ApplicationRecord
  has_secure_password
  validates :login, uniqueness: true
  validates :password_digest,
            presence: true,
            confirmation: true
  
end
