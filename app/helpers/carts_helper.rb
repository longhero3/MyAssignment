module CartsHelper
  def destroy_cart
    flash[:notice] = "Your cart has been expired"
    respond_to do |format|
      format.js { render 'carts/destroy', :layout => false }
    end
  end
end
