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


   end

   def recommended_items 
    @member = Member.find(params[:id])
    if !@member.diseases.empty?
      @recommended_items = Array.new

      @member.diseases.each do |disease|
        if !@disease.recommended_items.empty?
          @disease.recommended_items.each do |item|
            unless  @recommended_items.include? (item)
              @recommended_items.push(item)
            end
          end
        end
      end
    
      @member.diseases.each do |disease|
        if !@disease.restricted_items.empty?
          @recommended_items.each do |item|
            if @disease.restricted_items.include? (item)
              @recommended_items.delete(item)
            end
          end
        end
      end
      @member.recommended_items = recommended_items
      @member.save
    end
  end

  #Author : Magd Elshebokshy
  #Component : 3
  #Method name : recommended_items
  #Function : Make a list of recommended items to the member, using the 
  #recommended items and restricted items for his diseases.
  #Parameters : diseases - diseases' recommended items - diseases' restricted items.


   


