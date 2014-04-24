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
 

     
def after_sign_in_path_for(resource_or_scope)
	@member
end


#Authour: mohamed lotfy 
#Team : 1
#method : current_wish_new
#paramters : none
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

end