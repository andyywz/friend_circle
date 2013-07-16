class CirclesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_user!, except: [:new, :create]

  def new
    @user = current_user
    @circle = Circle.new
    render :new
  end

  def create
    @user = current_user
    params[:circle][:member_ids] << @user.id
    params[:circle][:user_id] = @user.id
    @circle = Circle.new(params[:circle])
    if @circle.save
      redirect_to circle_url(@circle.id)
    else
      flash.now[:notices] = "Invalid circle."
      render :new
    end
  end

  def show
    @circle = Circle.find(params[:id])
    render :show
  end

  private
  #ex: a non-circle owner can't edit/destroy another circle.
  def authorize_user!
    user = Circle.find(params[:id]).user
    if current_user != user
      flash[:notices] = "Unathorized action"
      redirect_to user_url(user.id)
    end
  end
end
