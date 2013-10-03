class SessionsController < ApplicationController
	skip_before_filter :authenticate
  def new
  	@cart = current_cart
    session[:fail_attempts_remain] = 3
  end

  def create
  	@cart = current_cart
  	user = User.authenticate(params[:username],params[:password])

  	# if user && user.is_activated && verify_recaptcha
  	# 	session[:user_id] = user.id
  	# 	redirect_to store_url, :notice => "You are Logged In"
  	# elsif user && !user.is_activated
   #    flash[:alert] = "Your account has not been activated"
   #    flash[:color] = "invalid"
   #    render "new"
   #  else
  	# 	flash[:alert] = "Wrong Username or Password "
   #    flash[:color] = "invalid"
   #    render "new"
  	# end

    if !user
      flash[:alert] = "Wrong Username or Password "
      flash[:color] = "invalid"
      render "new"
      session[:fail_attempts_remain] = session[:fail_attempts_remain] - 1 
    elsif !user.is_activated
      flash[:alert] = "Your account has not been activated"
      flash[:color] = "invalid"
      render "new"
    elsif verify_recaptcha == false && session[:fail_attempts_remain] < 1
      flash[:alert] = "The captcha typed is incorrect"
      flash[:color] = "invalid"
      render "new"
    else
      session[:user_id] = user.id
      redirect_to store_url, :notice => "You are Logged In"
    end

      


  end

  def destroy
  	session[:user_id] = nil
  	redirect_to store_url, :notice => " You've been Logged Out"
  end
end
