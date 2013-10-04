class MyDevise::MyPasswordsController < Devise::PasswordsController
  skip_before_filter :authenticate

  def new
    puts "jumps to new password url"
  	@cart = current_cart
  	super
  end

  def create
  	@cart = current_cart
  	super
  end

  def edit
  	@cart = current_cart
  	super
  end

end