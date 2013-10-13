class ApplicationController < ActionController::Base
  helper_method :current_user, :current_cart, :expire_time_left
  protect_from_forgery
  before_filter :update_expiry_time
  before_filter :expire_time_left
  include CartsHelper

  private 

  	def current_category
  		Category.find(session[:category_id])
  	rescue ActiveRecord::RecordNotFound
  		category = Category.first
  		session[:category_id] = category.id
  		category
  	end

  	def current_cart
  		Cart.find(session[:cart_id])
  	rescue ActiveRecord::RecordNotFound
  		cart = Cart.create
  		session[:cart_id] = cart.id
  		cart
  	end  

    def current_user
      User.find(session[:user_id])
    rescue ActiveRecord::RecordNotFound
      nil
    end

    def expire_time_left

      if session[:expire_at].nil?
        session[:expire_at] = 10.seconds.from_now
      end
      @session_time_left = ( session[:expire_at] - Time.now).to_i
    end

  protected 

    def authenticate
      set_return_point(request.url,true)
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice => "Please log in"
      end
    end

    def admin_authorize
      set_return_point(request.url,true)
      unless current_user.admin?
        redirect_to store_url, :notice => "You are not admin"
      end
    end

    def set_return_point(path, overwrite = false)
      if session[:return_point].blank?
        session[:return_point] = path
      end
    end

    def return_point
      session[:return_point] ? session[:return_point] : store_path
    end

    def session_expiry
      if expire_time_left < 0 
        current_cart.destroy
        destroy_cart
      end
    end

    def update_expiry_time
      session[:expire_at] = 10.seconds.from_now
    end
end
