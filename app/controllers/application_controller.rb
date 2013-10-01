class ApplicationController < ActionController::Base
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
end
