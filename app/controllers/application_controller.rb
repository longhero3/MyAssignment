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


end
