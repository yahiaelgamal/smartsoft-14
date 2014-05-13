class RegistrationsController < Devise::RegistrationsController
  #before_filter :update_sanitized_params, if: :devise_controller?

  def update_sanitized_params
devise_parameter_sanitizer.for(:sign_up) {|u| u.permit(:email, :password, :password_confirmation)}
devise_parameter_sanitizer.for(:account_update) {|u| u.permit(:email, :password, :password_confirmation)}
  end

  def new
    super
  end

  def create
 	  super
  end

  def update
    super
  end
  
  protected
  # to redirect to profile after edit it
     def after_update_path_for(resource)
       member_path(resource)
     end

end
