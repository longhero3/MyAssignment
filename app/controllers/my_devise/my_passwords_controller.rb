class MyDevise::MyPasswordsController < Devise::PasswordsController
  skip_before_filter :authenticate

  def new
    super
    puts "jumps to new password url"
  	@cart = current_cart
    render "my_devise/passwords/new"
  end

  def create
  	@cart = current_cart
  	super
  end

  def edit
  	@cart = current_cart
  	super
  end

  def reset_password
    @cart = current_cart
    @reset_token = params[:reset_password_token]
    render "my_devise/passwords/edit"
  end

  def update_password
    update_info = params[:update_password_info]
    result = User.update_password(update_info)
    respond_to do |format|
      if result.include? "Alert" 
        format.html { redirect_to reset_password_url(update_info[:reset_password_token]),
          alert: result}
      else
        format.html { redirect_to store_url, notice: result}
      end
    end
  end

end