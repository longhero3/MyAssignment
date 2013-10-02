class StoreController < ApplicationController
  skip_before_filter :authenticate
  def index
  	if params[:category]
  		session[:category_id] = params[:category]
  	end
    @cart = current_cart
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
