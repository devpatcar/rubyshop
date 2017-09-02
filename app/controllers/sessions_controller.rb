class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    #user = User.find_by_username(params[:username])
    #if user #&& user.authenticate(params[:password])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to '/admin', notice: "Logged in!"
    else
      flash.now.alert = "Email or password is invalid."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: 'Logged out!'
  end
end
