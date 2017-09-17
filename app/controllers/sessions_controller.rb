class SessionsController < ApplicationController  
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)    
    if user && user.authenticate(params[:session][:password])
      log_in user      
      render layout: "admin"
      redirect_to '/admin'
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out    
    redirect_to store_url
  end
end
