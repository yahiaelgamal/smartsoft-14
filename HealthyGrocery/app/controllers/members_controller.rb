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
#def show
 #   @member = Member.find(params[:id])
  #if current_member.email == 'admin@gmail.com'
  #end

     

  def show
@member = Member.find(params[:id])


#(GUI Team) This session is used to be able to navigate from the navigation bar to user's profile
#session["user_id"]= params[:id]

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
#session["isAdmin"]= @admin
#author: Fatma EmranS
#Team 2
#Funtion: Checkboxes for the people with health records of the user who wants to order.
def order_checkboxes
  @healthrecords = current_member.records
  @records_ids = params[:all]
  current_member.active_records = @records
  current_member.save
end

  
#Author : mina sedra
#team : 2
#method: get healthrecord
#params : none
#it shows the page of the member's healthrecord 
 def get_records
    @member = Member.find(params[:id])
    @healthrecord = @member.records
  respond_to do |format|
      format.html# show.html.erb
      format.json { render json: @healthrecord }
  end
  end

    end

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
#def show  
 #  @member = Member.find(params[:id])  
 #if current_member.email == 'admin@gmail.com'  
 #end  
 def show  
@member = Member.find(params[:id])  
def edit  
 @member = Member.find(params[:member_id])  
 #Author : mostafa adel  
 #team : 3  
 #method: edit profile  
 #params : @member  
end  
#(GUI Team) This session is used to be able to navigate from the navigation bar to user's profile  
#session["user_id"]= params[:id]  
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
#session["isAdmin"]= @admin  
  end  


