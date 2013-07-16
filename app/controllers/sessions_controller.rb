class SessionsController < ApplicationController
  def new

  end

  def create

  end

  def destroy
    logout
    redirect_to new_session_url
  end
end
