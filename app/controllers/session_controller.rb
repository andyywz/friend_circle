class SessionController < ApplicationController

  def new
    if !logged_in?
      @user = User.new
      render :new
    else
      @user_id = current_user.id
      flash[:notices] = "Already logged in"
      redirect_to user_url(@user_id)
    end
  end

  def create
    @user = User.find_by_username(params[:user][:username])
    if @user && !!@user.authenticate(params[:user][:password])
      login(@user)
      redirect_to @user
    else
      flash[:notices] = "Wrong username/password."
      redirect_to new_session_url
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

end
