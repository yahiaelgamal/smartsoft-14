class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.validate_login(
		params[:session][:email],
		params[:session][:password]
  		)

  	if user 
  		sessions[:user_id] = user_id
  		redirect_to :controller => 'users'
  	else 
  		flash[:status] = FALSE
  		flash[:alert] = 'Invalid username and/or password'
  		redirect_to login_path
  	end
  end

  def destory
  	session[:user_id] = nil
  	redirect_to login_path
  end
end
