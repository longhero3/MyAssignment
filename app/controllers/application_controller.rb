class ApplicationController < ActionController::Base
  before_filter :authenticate
  helper_method :current_user
  helper_method :current_cart
  protect_from_forgery

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

  protected 

    def authenticate
      set_return_point(request.url,true)
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice => "Please log in"
      end
    end

    def set_return_point(path, overwrite = false)
      if overwrite or session[:return_point].blank?
        session[:return_point] = path
      end
    end

    def return_point
      session[:return_point] ? session[:return_point] : store_path
    end

end
