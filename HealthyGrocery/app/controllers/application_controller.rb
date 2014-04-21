class ApplicationController < ActionController::Base
  protect_from_forgery
 

 

     
def after_sign_in_path_for(resource_or_scope)


	@member
end


def current_cart
if session[:cart_id].nil?
      @current_cart = Cart.create!
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end


def current_cart_new
  if current_member.cart.nil?
    @newcart = Cart.create!
    current_member.cart = @newcart
    current_member.save
    @exist = true
  else
    @newcart = current_member.cart
    @exist = true
  end
  @newcart
  end




  def current_cart_old
    Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create
      session[:cart_id] = cart.id
      cart
  end
  helper_method :current_cart_old

end
