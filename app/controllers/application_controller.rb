class ApplicationController < ActionController::Base
  before_filter :authenticate
  helper_method :current_user
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
      unless User.find_by_id(session[:user_id])
        redirect_to login_url, :notice => "Please log in"
      end
    end

end
