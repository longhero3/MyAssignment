class UsersController < ApplicationController
  # GET /users
  # GET /users.json
  skip_before_filter :authenticate
  def index
    @cart = current_cart
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @cart = current_cart
    @user = User.confirm_user(params[:confirmation_token])

    respond_to do |format|
      if @user
        format.html { redirect_to store_url, notice: "Your account is now activated "}
        format.json { render json: @user }
      else
        format.html { redirect_to store_url, alert: "The activation code is invalid "}
        format.json { render json: @user }
      end
    end
  end

  # GET /users/new
  # GET /users/new.json
  def new
    @cart = current_cart
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end

  # GET /users/1/edit
  def edit
    @cart = current_cart
    @user = User.find_by_reset_password_token(:reset_password_token)
  end

  # POST /users
  # POST /users.json
  def create
    @cart = current_cart
    @user = User.addUser(params[:user])

    respond_to do |format|
      if @user.save
        flash[:notice] = "Successfully registered"
        flash[:color] = "valid"
        format.html { redirect_to store_url, notice: 'User created. The activation link has been sent' }
        format.json { render json: @user, status: :created, location: @user }
      else
        flash[:notice] = "The form is invalid"
        flash[:color] = "invalid"
        format.html { render action: "new" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /users/1
  # PUT /users/1.json
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if @user.update_attributes(params[:user])
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user = User.find(params[:id])
    @user.destroy

    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end
end
