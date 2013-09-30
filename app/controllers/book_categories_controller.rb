class BookCategoriesController < ApplicationController
  # GET /book_categories
  # GET /book_categories.json
  def index
    @book_categories = BookCategory.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @book_categories }
    end
  end

  # GET /book_categories/1
  # GET /book_categories/1.json
  def show
    @book_category = BookCategory.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @book_category }
    end
  end

  # GET /book_categories/new
  # GET /book_categories/new.json
  def new
    @book_category = BookCategory.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @book_category }
    end
  end

  # GET /book_categories/1/edit
  def edit
    @book_category = BookCategory.find(params[:id])
  end

  # POST /book_categories
  # POST /book_categories.json
  def create
    @book_category = BookCategory.new(params[:book_category])

    respond_to do |format|
      if @book_category.save
        format.html { redirect_to @book_category, notice: 'Book category was successfully created.' }
        format.json { render json: @book_category, status: :created, location: @book_category }
      else
        format.html { render action: "new" }
        format.json { render json: @book_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /book_categories/1
  # PUT /book_categories/1.json
  def update
    @book_category = BookCategory.find(params[:id])

    respond_to do |format|
      if @book_category.update_attributes(params[:book_category])
        format.html { redirect_to @book_category, notice: 'Book category was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @book_category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /book_categories/1
  # DELETE /book_categories/1.json
  def destroy
    @book_category = BookCategory.find(params[:id])
    @book_category.destroy

    respond_to do |format|
      format.html { redirect_to book_categories_url }
      format.json { head :no_content }
    end
  end
end
