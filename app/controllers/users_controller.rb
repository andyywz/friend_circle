class UsersController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login
      redirect_to @user, notice: "Thank you for signing up!"
    else
      flash[:notices] = "Invalid username/password."
      redirect_to new_user_url
    end
  end

  def show
    @user = User.find(params[:id])
    render :show
  end
end