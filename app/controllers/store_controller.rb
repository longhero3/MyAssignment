class StoreController < ApplicationController
  def index
  	@books = Book.order(:title).page(1)
  	if params[:page] 
  		@books = Book.order(:title).page(params[:page])
  	end
  	@categories = Category.order(:name)

  	respond_to do |format|
  		format.html
  		format.js
  		format.json
  	end
  end
end
