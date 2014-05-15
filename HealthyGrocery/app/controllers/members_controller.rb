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


#Author: omar tarek
#team:5
#method:hub
#params:none
#it creates arrays of recently added items, trucks, drivers, diseases, 
#as well as items out of stock and items purchased today to be used in the hub.html.erb file 

def hub

  @itemsToday = Array.new 
  @itemsOutOfStock = Array.new 
  @itemsAddedThisWeek = Array.new
  @trucksAddedThisWeek = Array.new  
  @diseasesAddedThisWeek = Array.new
  @driversAddedThisWeek = Array.new 
  

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

 
  def show_restricted_items
    
    @member = current_member
    
    if current_member.email == 'admin@gmail.com'
        @admin = true
    else 
      @admin = false
    end
  end

  # def show_ideal_calories
    
  #   @member = current_member
    
  #   if current_member.email == 'admin@gmail.com'
  #       @admin = true
  #   else 
  #     @admin = false
  #   end
  # end

  def calculated_ideal
    
    @member = current_member
    
    if current_member.email == 'admin@gmail.com'
        @admin = true
    else 
      @admin = false
    end
  end


  
  #Atuhor: ahmed helali
  #team 2
  #method: show_ideal_calories
  #parameters: none
  #function: reponsible for the view of the same name

  def show_ideal_calories
    
    @member = current_member
    @weight = ""
    @duration = ""
    
    if current_member.email == 'admin@gmail.com'
        @admin = true
    else 
      @admin = false
    end
  end


end  



