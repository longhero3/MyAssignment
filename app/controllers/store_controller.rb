class StoreController < ApplicationController
  def index
  	@books = Book.search(params[:search]).order(:title).paginate(:per_page => 5, :page => params[:page])
  	@categories = Category.order(:name)

  	respond_to do |format|
  		format.html
  		format.js
  		format.json
  	end
  end
end
