class UsersController < ApplicationController
  before_filter :authorize_user!, except: [:new,:create]
  before_filter :authenticate_user!, except: [:new,:create]

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      login(@user)
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

  private

  def authorize_user!
    user = User.find(params[:id])
    if current_user != user
      flash[:notices] = "You must be logged in to do this"
      redirect_to new_session_url
    end
  end
end