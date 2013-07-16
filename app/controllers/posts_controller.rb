class PostsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :authorize_user!, except: [:new, :create]

  def new
    @user = current_user
    @post = Post.new
    render :new
  end

  def create
    @user = current_user
    params[:post][:user_id] = @user.id
    @post = Post.new(params[:post])
    if @post.save
      redirect_to post_url(@post.id)
    else
      flash[:notices] = "Invalid post"
      redirect_to new_post_url
    end
  end

  def show
    @post = Post.find(params[:id])
    render :show
  end

  private
  #ex: a non-circle owner can't edit/destroy another circle.
  def authorize_user!
    post = Post.find(params[:id])
    user = post.user
    if (post.circles&user.participating_circles).empty?
      flash[:notices] = "Unathorized action"
      redirect_to user_url(user.id)
    end
  end
end
