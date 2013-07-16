
class User < ActiveRecord::Base
  #BCrypt requires the column name to be password_digest, but is
  #reffered to as password
  has_secure_password

  attr_accessible :password, :password_confirmation, :username, :session_token

  validates :password, :username, presence: true
  validates :username, uniqueness: true
  validates_confirmation_of :password


end
