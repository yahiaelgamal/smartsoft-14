class ApplicationController < ActionController::Base
  protect_from_forgery
 
# ---------------------------------------------------------------------------------------
  # (By the GUI Team) This part is added so that Sign in, 
  # Sign Up or Forgot my Password Have a different
  # layout than the layout of 'application.html.erb' and inherets the layout
  # of 'sample.html.erb'

   layout :signIn
 def signIn
    if devise_controller?
      "signIn"
    else
      "application"
    end
end

# ---------------------------------------------------------------------------------------
#Authour: Mohamed Lotfy
#Team: 1
#Method: after_sign_in_path_for
#Paramters: resource or the member on which the process is done!
#it redirects to the page of the member signed in by writing the path inside the body of the method
def after_sign_in_path_for(resource_or_scope)
    @member
end

#Authour: Mohamed Saeed
#Team : 1
#Method : current_wish_new
#Paramters : none
#it checks if the user has a wishlist after the sign in or sign up if yes it uses it if no it creates a new one for him
def current_wish_new
	if current_member.wishlist.nil?
		  @newwish = Wishlist.create!
		  current_member.wishlist = @newwish
		  current_member.save
		  @wishexist = true
	else
		  @newwish = current_member.wishlist
		  @wishexist = true
	end
		  @newwish 
end  

#Author: Abdelrahman Sakr
#Team : 1
#Method : current_cart_new
#Paramters : None
#This method checks whether the user has a shopping cart or not, if exists it returns it, else it creates
#a new cart and returns it.

def current_cart_new
  if current_member.cart.nil?
    @newcart = Cart.create!
    current_member.cart = @newcart
    current_member.save
  else
    @newcart = current_member.cart
  end
  @newcart
end




  

end
