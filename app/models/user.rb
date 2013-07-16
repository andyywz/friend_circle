class User < ActiveRecord::Base
  include BCrypt

  attr_accessible :password, :username, :session_token

  validates :password, :username, presence: true
  validates :username, uniqueness: true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
