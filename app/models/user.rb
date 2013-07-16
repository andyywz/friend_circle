require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  attr_accessible :password, :password_confirmation, :username, :session_token

  validates :password, :username, presence: true
  validates :username, uniqueness: true
  validates_confirmation_of :password

  # def password
  #   @password ||= Password.new(password)
  # end
  #
  # def password=(new_password)
  #   @password = Password.create(new_password)
  #   self.password = @password
  # end

end
