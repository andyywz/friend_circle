class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params[:user])
    @user.password = params[:user][:password]
    if @user.save
      login
      redirect_to new_user_url
    else
      flash[:notices] = "Invalid username/password."
      redirect_to new_user_url
    end
  end

end