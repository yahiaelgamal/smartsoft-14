class ApplicationController < ActionController::Base
  protect_from_forgery
 

 

     
def after_sign_in_path_for(resource_or_scope)


	@member
end

def set_admin

	if current_member.email == 'admin@gmail.com'
		@k = true
    else
   		@k = false
    end	
end
  

end