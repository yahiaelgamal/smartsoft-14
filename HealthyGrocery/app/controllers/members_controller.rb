class MembersController < ApplicationController
  before_filter :authenticate_member!
   

  def index
    @members = Member.all
     
  end

  def show
@member = Member.find(params[:id])

#(GUI Team) This session is used to be able to navigate from the navigation bar to user's profile
session["user_id"]= params[:id]

  	if current_member.email == 'admin@gmail.com'
  		@admin = true
else 
	@admin = false
    end
   
   end
   

end
