class SessionsController < ApplicationController
	skip_before_filter :authenticate
  def new
  	@cart = current_cart
  end

  def create
  	@cart = current_cart
  	user = User.authenticate(params[:username],params[:password])
  	if user && user.is_activated
  		session[:user_id] = user.id
  		redirect_to store_url, :notice => "You are Logged In"
  	elsif user && !user.is_activated
      flash[:alert] = "Your account has not been activated"
      flash[:color] = "invalid"
      render "new"
    else
  		flash[:alert] = "Wrong Username or Password"
      flash[:color] = "invalid"
      render "new"
  	end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to store_url, :notice => " You've been Logged Out"
  end
end
