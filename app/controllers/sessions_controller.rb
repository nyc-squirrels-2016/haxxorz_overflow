class SessionsController < ApplicationController

  def new
    @user = User.new
  end

  def destroy
    session.clear
    redirect_to '/'
  end

  def create
    user = User.find_by(username: params[:username])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      @user = User.new
      flash[:notice]=["Couldn't log you in."]
      render :new
    end
  end



end
