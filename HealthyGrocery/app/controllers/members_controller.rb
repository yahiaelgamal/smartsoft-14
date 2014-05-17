class MembersController < ApplicationController
  before_filter :authenticate_member!

  #Author: Mohamed Lotfy
  #Team: 1
  #Method: index
  #Function: it lists all the users on the database it has a boolean check for a variable called admin to controll visibilty of all the members for only the admin
  #Parameters: none
  
  def index
    @members = Member.all
    if current_member.email == 'healthygrocery@gmail.com'
      @admin = true
    else
      @admin = false
  end    
end


#Author: omar tarek
#Team:5
#Method:hub
#Parameters:none
#Function: it creates arrays of recently added items, trucks, drivers, diseases, 
#as well as items out of stock and items purchased today to be used in the hub.html.erb file 

def hub

  @items_Today = Array.new 
  @items_Out_Of_Stock = Array.new 
  @items_Added_This_Week = Array.new
  @trucks_Added_This_Week = Array.new  
  @diseases_Added_This_Week = Array.new
  @drivers_Added_This_Week = Array.new 
  
end  







  #Author: Mohamed Lotfy
  #Team: 1
  #Method: show
  #Function: it shows the page of the user signed in or signed up it has the same check to differentiate between the admin and the user page
  #Parameters: none


  def edit
    @member = Member.find(params[:id])
  end
     

  def show
    @member = Member.find(params[:id])
    if current_member.email == 'healthygrocery@gmail.com'
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
    @health_records = @member.records 

  respond_to do |format|
      format.html# show.html.erb
      format.json { render json: @healthrecord }
    end
  end

  def show_restricted_items
  @member = current_member
  if current_member.email == 'healthygrocery@gmail.com'
      @admin = true
    else
      @admin = false
    end
  end

# def show_ideal_calories
# @member = current_member
# if current_member.email == 'admin@gmail.com'
#@admin = true
  #   else
  #     @admin = false
  #   end
  # end

  def calculated_ideal
    @member = current_member
    if current_member.email == 'healthygrocery@gmail.com'
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

    if current_member.email == 'healthygrocery@gmail.com'
      @admin = true
    else
      @admin = false
    end
  end

  #Atuhor: ahmed abdelsattar
  #team 2
  #method: generate_routes
  #parameters: none
  #function: calling the generate_routes method from Shipment model
  
  def generate_routes
    Shipment.generate_routes
    redirect_to "/members/hub"
  end
end
