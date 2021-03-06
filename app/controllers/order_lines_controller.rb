class OrderLinesController < ApplicationController
  # GET /order_lines
  # GET /order_lines.json
  before_filter :admin_authorize, :only => [:edit, :update]
  def index
    @cart = current_cart
    @order_lines = OrderLine.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @order_lines }
    end
  end

  # GET /order_lines/1
  # GET /order_lines/1.json
  def show
    @cart = current_cart
    @order_line = OrderLine.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order_line }
    end
  end

  # GET /order_lines/new
  # GET /order_lines/new.json
  def new
    @cart = current_cart
    @order_line = OrderLine.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order_line }
    end
  end

  # GET /order_lines/1/edit
  def edit
    @cart = current_cart
    @order_line = OrderLine.find(params[:id])
  end

  # POST /order_lines
  # POST /order_lines.json
  def create
    @cart = current_cart
    book = Book.find(params[:book_id])
    @order_line = @cart.add_book(book.id)
    
    respond_to do |format|
      if @order_line.save
        format.html { redirect_to store_url, notice: "The book #{book.title} has been added to cart" }
        format.js
        format.json { render json: @order_line, status: :created, location: @order_line }
      else
        format.html { render action: "new" }
        format.json { render json: @order_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /order_lines/1
  # PUT /order_lines/1.json
  def update
    @order_line = OrderLine.find(params[:id])

    respond_to do |format|
      if @order_line.update_attributes(params[:order_line])
        format.html { redirect_to @order_line, notice: 'Order line was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_lines/1
  # DELETE /order_lines/1.json
  def destroy
    @cart = current_cart
    @order_line = @cart.minus_quantity(params[:id])


    respond_to do |format|
      if @order_line.save
        format.html { redirect_to order_lines_url, notice: "One order item has been deleted" }
        format.js
        format.json { head :no_content }
      end
    end
  end
end
