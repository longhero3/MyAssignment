class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  before_filter :authenticate
  def index
    @cart = current_cart
    @orders = Order.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @cart = current_cart
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  #GET /my_orders
  def my_orders
    @cart = current_cart
    @orders = Order.where('user_id = ?', "#{session[:user_id]}").paginate(:per_page => 8, :page => params[:page])
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @cart = current_cart
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/1/edit
  def edit
    @cart = current_cart
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @cart = current_cart
    result = Order.create_order(params[:order])

    respond_to do |format|
      if result
        OrderLine.update_order_lines(result.id, @cart.id)
        # @cart.destroy
        format.html { redirect_to store_url, notice: "Your order is confirmed and saved" }
        format.json { render json: @order, status: :created, location: @order }
      else
        flash[:alert] = "Empty address"
        format.html { render action: "new"}
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @cart = current_cart
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @cart = current_cart
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end
end
