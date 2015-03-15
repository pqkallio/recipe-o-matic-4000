class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by username: params[:username]

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to user_path(user), notice: "Hi #{user.username}! Let's start cooking!"
    else
      redirect_to :back, notice: "Username and/or password mismatch"
    end
  end

  def destroy
    reset_session
    redirect_to :root
  end

end