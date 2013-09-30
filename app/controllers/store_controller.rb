class StoreController < ApplicationController
  def index
  	if params[:category]
  		session[:category_id] = params[:category]
  	end
  	@current_category = current_category
  	@books = @current_category.books.search(params[:search]).order(:title).paginate(:per_page => 5, :page => params[:page])
  	#@books = Book.search(params[:search]).order(:title).paginate(:per_page => 5, :page => params[:page])
  	@categories = Category.order(:id)

  	respond_to do |format|
  		format.html
  		format.js
  		format.json
  	end
  end
end
