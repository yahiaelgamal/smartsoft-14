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
  

end