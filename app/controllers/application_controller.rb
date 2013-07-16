class ApplicationController < ActionController::Base
  protect_from_forgery

  def authenticate_user!
    redirect_to new_session_url unless logged_in?
  end

  def generate_session_token
    token = SecureRandom.urlsafe_base64
    while User.find_by_session_token(token)
      token = SecureRandom.urlsafe_base64
    end
    token
  end

  def current_user
    return nil unless session[:token]
    @current_user ||= User.find_by_session_token(session[:token])
  end

  def logout
    session[:token] = nil
  end

  def login
    @user.session_token = generate_session_token
    @user.save!
    session[:token] = @user.session_token
  end

  def logged_in?
    !!current_user
  end
end
