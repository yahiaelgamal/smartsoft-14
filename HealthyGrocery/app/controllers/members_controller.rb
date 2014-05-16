class MembersController < ApplicationController
  before_filter :authenticate_member!

<<<<<<< HEAD
  #Author : mohamed lotfy
  #team : 1
  #method:index
  #params : none

  #it lists all the users on the database it has a boolean check for a variable called admin to controll   visibilty of all the members for only the admin


  # Author : Mostafa Adel
  # Team   : 3
  # Method : Index
  # Description : Retailer can see all members  with  pagination and search for them.
  def index

    @members = Member.all.page(params[:page]).per(20)

    if (!params[:search].nil?)
       @members= Member.where(:first_name => /^#{params[:search]}/i).page(params[:page]).per(20)

    end

    if current_member.email == 'admin@gmail.com'
=======
  #Author: Mohamed Lotfy
  #Team: 1
  #Method: index
  #Function: it lists all the users on the database it has a boolean check for a variable called admin to controll visibilty of all the members for only the admin
  #Parameters: none
  
  def index
    @members = Member.all
    if current_member.email == 'healthygrocery@gmail.com'
>>>>>>> aa02ff06045f379c13b1e2973edd394ad5bcad3a
      @admin = true
    else
      @admin = false
    end
  end
<<<<<<< HEAD
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



=======

  #Author: Mohamed Lotfy
  #Team: 1
  #Method: show
  #Function: it shows the page of the user signed in or signed up it has the same check to differentiate between the admin and the user page
  #Parameters: none
  
  def show
    @member = Member.find(params[:id])
    if current_member.email == 'healthygrocery@gmail.com'
      @admin = true
    else
      @admin = false
    end
>>>>>>> aa02ff06045f379c13b1e2973edd394ad5bcad3a
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
<<<<<<< HEAD
=======
  
>>>>>>> aa02ff06045f379c13b1e2973edd394ad5bcad3a
  def order_checkboxes
    @healthrecords = current_member.records
    @records_ids = params[:all]
    current_member.active_records = @records
    current_member.save
  end
<<<<<<< HEAD


  #Author : mina sedra
  #team : 2
  #method: get healthrecord
  #params : none
  #it shows the page of the member's healthrecord
  def get_records

    @member = Member.find(params[:id])
    @healthrecord = @member.records
    respond_to do |format|
=======

  #Author : mina sedra
  #team : 2
  #method: get healthrecord
  #params : none
  #it shows the page of the member's healthrecord
  
  def get_records
    @member = Member.find(params[:id])
    @health_records = @member.records 

  respond_to do |format|
>>>>>>> aa02ff06045f379c13b1e2973edd394ad5bcad3a
      format.html# show.html.erb
      format.json { render json: @healthrecord }
    end
  end

<<<<<<< HEAD

  def show_restricted_items

    @member = current_member

    if current_member.email == 'admin@gmail.com'
=======
  def show_restricted_items
  @member = current_member
  if current_member.email == 'healthygrocery@gmail.com'
>>>>>>> aa02ff06045f379c13b1e2973edd394ad5bcad3a
      @admin = true
    else
      @admin = false
    end
  end

<<<<<<< HEAD
  # def show_ideal_calories

  #   @member = current_member

  #   if current_member.email == 'admin@gmail.com'
  #       @admin = true
=======
# def show_ideal_calories
# @member = current_member
# if current_member.email == 'admin@gmail.com'
#@admin = true
>>>>>>> aa02ff06045f379c13b1e2973edd394ad5bcad3a
  #   else
  #     @admin = false
  #   end
  # end

  def calculated_ideal
<<<<<<< HEAD

    @member = current_member

    if current_member.email == 'admin@gmail.com'
=======
    @member = current_member
    if current_member.email == 'healthygrocery@gmail.com'
>>>>>>> aa02ff06045f379c13b1e2973edd394ad5bcad3a
      @admin = true
    else
      @admin = false
    end
  end
<<<<<<< HEAD



=======
  
>>>>>>> aa02ff06045f379c13b1e2973edd394ad5bcad3a
  #Atuhor: ahmed helali
  #team 2
  #method: show_ideal_calories
  #parameters: none
  #function: reponsible for the view of the same name

  def show_ideal_calories
<<<<<<< HEAD

=======
>>>>>>> aa02ff06045f379c13b1e2973edd394ad5bcad3a
    @member = current_member
    @weight = ""
    @duration = ""

<<<<<<< HEAD
    if current_member.email == 'admin@gmail.com'
=======
    if current_member.email == 'healthygrocery@gmail.com'
>>>>>>> aa02ff06045f379c13b1e2973edd394ad5bcad3a
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
<<<<<<< HEAD
=======
  
>>>>>>> aa02ff06045f379c13b1e2973edd394ad5bcad3a
  def generate_routes
    Shipment.generate_routes
    redirect_to "/members/hub"
  end
end
