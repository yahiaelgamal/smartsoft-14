class MembersController < ApplicationController
  before_filter :authenticate_member!
   
#Author : mohamed lotfy
#team : 1
#method:index
#params : none
#it lists all the users on the database it has a boolean check for a variable called admin to controll visibilty of all the members for only the admin 
def index
    @members = Member.all

  if current_member.email == 'admin@gmail.com'
      @admin = true
  else 
      @admin = false
  end    
end
#Author : mohamed lotfy
#team : 1
#method: show
#params : none
#it shows the page of the user signed in or signed up it has the same check to differentiate between the admin and the user page
def show
    @member = Member.find(params[:id])
  if current_member.email == 'admin@gmail.com'

     
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
   

  if current_member.wishlist.nil?
      @wishexist = false
  else 
      @wishexist = true
  end
end

   #(GUI Team) This session is used to be able to diffirentiate from normal User/Admin 
session["isAdmin"]= @admin


   end


   

 end
