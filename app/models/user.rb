class User < ActiveRecord::Base
  #BCrypt requires the column name to be password_digest, but is
  #reffered to as password
  has_secure_password

  attr_accessible :password, :password_confirmation, :username, :session_token

  validates :password_digest, :username, presence: true
  validates :username, uniqueness: true
  validates_confirmation_of :password

  has_many :circle_memberships
  has_many :owned_circles, class_name: "Circle", foreign_key: "user_id"
  #tells rails that participating_circles really refers to :circle
  has_many :participating_circles, through: :circle_memberships, source: :circle
  has_many :posts
end
