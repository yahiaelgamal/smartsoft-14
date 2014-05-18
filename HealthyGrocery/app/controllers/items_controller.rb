class ItemsController < ApplicationController

  # GET /items
  # GET /items.json
  # shows all the items in the table item
  def index


    #Author: Amr Nabil 
    #Team: 3
    #paginating items in the warehouse to be displayed  
                  
    @items = Item.all.page(params[:page]).per(5)

    if current_member.email == 'healthygrocery@gmail.com'
      @admin = true
    else
      @admin = false

    end    
    @items = Item.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end
  #Author : Amr Nabil
  #Team 3
  # GET /items/1/editprice
  # gets the item with the price to be edited and store it in variable @item
  def editprice
    @item = Item.find(params[:id])
  end
  # GET /items/1
  # GET /items/1.json
  # show a certain item from a table item using the attribute id
  def show
    @item = Item.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  # renders the information from the form then creates a new unsaved record
  def new
    @item = Item.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/1/edit
  # gets the item to be edited and store it in variable @item
  def edit
    @item = Item.find(params[:id])
  end

  #Author: Hazem Amin
  #Team: 5
  #Method name: toggle_pause
  #Function: It simply finds that specific item that needs to be paused and pauses
  #it if the conditions applies that the item is not out of stock.
  def toggle_pause
    flash[:notice] = Item.toggle_pause(params[:id])
    redirect_to items_url
  end

  #Author: Hazem Amin
  #Team: 5
  #Method name: create
  #Funtion: It simply CEATES an item, as being one of the 4 fundumentals of CRUD.
  #The first if-condition I make sure that we're not trying to access an item that hasn't an
  #amount field specified, the second condition decides the initial values of paused when it is
  #created, whether it should be initially paused or resumed.
  def create
    @item = Item.new(params[:item])

    if @item.amount
    # initial value of paused
    if @item.amount <= 0
      @item.paused = false
    else
      @item.paused = true
    end
  end
    respond_to do |format|
      if @item.save
        format.html { redirect_to @item, notice: 'Item was successfully created.' }
        format.json { render json: @item, status: :created, location: @item }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  #views the users without the create button
  def viewusers
    @users = User.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @users }
    end
  end


  # PUT /items/1
  # PUT /items/1.json
  # updated an existing record taking its info from the def edit
  def update
    @item = Item.find(params[:id])

    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end
  #Author : Amr Nabil
  #Team 3
  #Put /items/1
  #put /items/1.json
  #update the existing price for an item taking its value from the def editprice
  def updateprice
    @item = Item.find(params[:id])
    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html {redirect_to @item, notice: 'Items price was successfully updated.'}
        format.json {head :no_content}
      else
        format.html { render action: "editprice" } 
        format.json { render json: @item.errors, status: :unprocessable_entity}
      end
    end
  end       

  # DELETE /items/1
  # DELETE /items/1.json
  # deletes a record
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :no_content }
    end
  end


#Author: Antoine Foti
#Team: 2
#Method name: Filter_1
#Function: It is the first part of my filter search as it is too long to fit in one method.
#It filters the correct items and forms the corresponding messages for the user according to his search.
#Parameters: The status of the items (available items or all items), the items' name and the category.
  def filter_1
    @items = Item.all
    @notification = ""
    @warning = ""
    @type_warning = "" 
    if(params[:items_per_page].nil?)
      @items = @items.page(params[:page]).per(5)
      @showing_pages = "Showing 5 per page."
    else
      @items = @items.page(params[:page]).per(params[:items_per_page])
      @showing_pages = "Showing " + params[:items_per_page] + " per page."
    end
    if Item.all.count > 0
      if (params[:status] == 'available')
        @items = @items.where :status => true
        if !(Item.all.where :status => true).exists?
          @warning += "Sorry.. There is nothing available in stock | "
          @notification = ""
          @showing_pages = ""
        elsif @items.count > 0
          @notification += "Showing from available products in stock only | "
        end
      else
        @notification += "Showing from available & not available products | "
      end
      if (params[:name] != '' && !params[:name].nil?)
        if !params[:name].numeric?
          @items = @items.where name: /^#{params[:name]}/i
          if !(Item.all.where name: /^#{params[:name]}/i).exists?
            @warning += "Sorry.. There is no matching names for " + params[:name] + " | "
            @notification = ""
            @showing_pages = ""
          elsif @items.count > 0 
            @notification += "Matching name with " + params[:name] + " | "
          end
        else
          @type_warning += "Please choose correct characters for searching the name | " 
        end
      end
      if (params[:category] != '<None>' && !params[:category].nil?)
        @items = @items.where category: params[:category]
        if !(Item.all.where category: params[:category]).exists?
          @warning += "Sorry.. There is no items in this category | "
          @notification = ""
          @showing_pages = ""
        elsif @items.count > 0
          @notification += "From " + params[:category] + "'s category | "
        end
      end
  end


#Author: Antoine Foti
#Team: 2
#Method name: Filter_2
#Function: It is the second part of my filter search. It also filters the correct items and forms 
#the corresponding messages for the user according to his search.
#Parameters: The range of the items' prices and the range of the items' ratings.
  def filter_2
    if (params[:price_from] != '' && !params[:price_from].nil?)
      if params[:price_from].numeric?
        @items = @items.where :price.gte => params[:price_from]
        if !(Item.all.where :price.gte => params[:price_from]).exists?
          @warning += "Sorry.. There is no items starting from " + params[:price_from] + "$ | "
          @notification = ""
          @showing_pages = ""
        elsif @items.count > 0
          @notification += "Price greater than or equal " + params[:price_from] + "$ | "
        end
      else
        @type_warning += "Please choose a number for the starting price | "
      end
    end
    if (params[:price_to] != '' && !params[:price_to].nil?)
      if params[:price_to].numeric?
        @items = @items.where :price.lte => params[:price_to]
        if !(Item.all.where :price.lte => params[:price_to]).exists?
          @warning += "Sorry.. There is no items below " + params[:price_to] + "$ | "
          @notification = ""
          @showing_pages = ""
        elsif @items.count > 0
          @notification += "Price less than or equal " + params[:price_to] + "$ | "
        end
      else
        @type_warning += "Please choose a number for the ending price | " 
      end
    end
    if (params[:rating_from] != '' && !params[:rating_from].nil?)
      if params[:rating_from].numeric?
        @items = @items.where :rating.gte => params[:rating_from]
        if !(Item.all.where :rating.gte => params[:rating_from]).exists?
          @warning += "Sorry.. There is no items starting from " + params[:rating_from] + " rate(s) | "
          @notification = ""
          @showing_pages = ""
        elsif @items.count > 0
          @notification += "Rating greater than or equal " + params[:rating_from] + " | "
        end
      else
        @type_warning += "Please choose a number for the starting rating | "
      end
    end
    if (params[:rating_to] != '' && !params[:rating_to].nil?)
      if params[:rating_to].numeric?
        @items = @items.where :rating.lte => params[:rating_to]
        if !(Item.all.where :rating.lte => params[:rating_to]).exists?
          @warning += "Sorry.. There is no items below " + params[:rating_to] + " rate(s) | "
          @notification = ""
          @showing_pages = ""
        elsif @items.count > 0
          @notification += "Rating less than or equal " + params[:rating_to] + " | "
        end
      else
        @type_warning += "Please choose a number for the ending rating | "
      end
    end
  end


#Author: Antoine Foti
#Team: 2
#Method name: Filter_3
#Function: It is the third part of my filter search. It also filters the correct items and forms 
#the corresponding messages for the user according to his search.
#Parameters: The amounts(High, Medium or Low) of the vitamins A, B, C, D and E.
  def filter_3
    if !params[:Vitamin_A].nil?
      @items = @items.where vit_a_type: params[:Vitamin_A]
      if !(Item.all.where vit_a_type: params[:Vitamin_A]).exists? 
        @warning += "Sorry.. There is no items having " + params[:Vitamin_A] + " amount of Vitamin A | "
        @notification = ""
        @showing_pages = ""
      elsif @items.count > 0
        @notification += "containing " + params[:Vitamin_A] + " amount of Vitamin A | "
      end
    end
    if !params[:Vitamin_B].nil?
      @items = @items.where vit_b_type: params[:Vitamin_B]
      if !(Item.all.where vit_b_type: params[:Vitamin_B]).exists? 
        @warning += "Sorry.. There is no items having " + params[:Vitamin_B] + " amount of Vitamin B | "
        @notification = ""
        @showing_pages = ""
      elsif @items.count > 0
        @notification += "containing " + params[:Vitamin_B] + " amount of Vitamin B | "
      end
    end
    if !params[:Vitamin_C].nil?
      @items = @items.where vit_c_type: params[:Vitamin_C]
      if !(Item.all.where vit_c_type: params[:Vitamin_C]).exists? 
        @warning += "Sorry.. There is no items having " + params[:Vitamin_C] + " amount of Vitamin C | "
        @notification = ""
        @showing_pages = ""
      elsif @items.count > 0
        @notification += "containing " + params[:Vitamin_C] + " amount of Vitamin C | "
      end
    end
    if !params[:Vitamin_D].nil?
      @items = @items.where vit_d_type: params[:Vitamin_D]
      if !(Item.all.where vit_d_type: params[:Vitamin_D]).exists? 
        @warning += "Sorry.. There is no items having " + params[:Vitamin_D] + " amount of Vitamin D | "
        @notification = ""
        @showing_pages = ""
      elsif @items.count > 0
        @notification += "containing " + params[:Vitamin_D] + " amount of Vitamin D | "
      end
    end
    if !params[:Vitamin_E].nil?
      @items = @items.where vit_e_type: params[:Vitamin_E]
      if !(Item.all.where vit_e_type: params[:Vitamin_E]).exists? 
        @warning += "Sorry.. There is no items having " + params[:Vitamin_E] + " amount of Vitamin E | "
        @notification = ""
        @showing_pages = ""
      elsif @items.count > 0
        @notification += "containing " + params[:Vitamin_E] + " amount of Vitamin E | "
      end
    end
  end


#Author: Antoine Foti
#Team: 2
#Method name: Filter_4
#Function: It is the fourth part of my filter search. It also filters the correct items and forms 
#the corresponding messages for the user according to his search.
#Parameters: The amounts(High, Medium or Low) of vitamin K, Proteins, Carbohydrate, Calcium and Fats.
  def filter_4
    if !params[:Vitamin_K].nil?
      @items = @items.where vit_k_type: params[:Vitamin_K]
      if !(Item.all.where vit_k_type: params[:Vitamin_K]).exists? 
        @warning += "Sorry.. There is no items having " + params[:Vitamin_K] + " amount of Vitamin K | "
        @notification = ""
        @showing_pages = ""
      elsif @items.count > 0
        @notification += "containing " + params[:Vitamin_K] + " amount of Vitamin K | "
      end
    end
    if !params[:Proteins].nil?
      @items = @items.where protein_type: params[:Proteins]
      if !(Item.all.where protein_type: params[:Proteins]).exists? 
        @warning += "Sorry.. There is no items having " + params[:Proteins] + " amount of Proteins | "
        @notification = ""
        @showing_pages = ""
      elsif @items.count > 0
        @notification += "containing " + params[:Proteins] + " amount of Proteins | "
      end
    end
    if !params[:Carbohydrate].nil?
      @items = @items.where carbohydrate_type: params[:Carbohydrate]
      if !(Item.all.where carbohydrate_type: params[:Carbohydrate]).exists? 
        @warning += "Sorry.. There is no items having " + params[:Carbohydrate] + " amount of Carbohydrate | "
        @notification = ""
        @showing_pages = ""
      elsif @items.count > 0
        @notification += "containing " + params[:Carbohydrate] + " amount of Carbohydrate | "
      end
    end
    if !params[:Calcium].nil?
      @items = @items.where calcium_type: params[:Calcium]
      if !(Item.all.where calcium_type: params[:Calcium]).exists? 
        @warning += "Sorry.. There is no items having " + params[:Calcium] + " amount of Calcium | "
        @notification = ""
        @showing_pages = ""
      elsif @items.count > 0
        @notification += "containing " + params[:Calcium] + " amount of Calcium | "
      end
    end
    if !params[:Fats].nil?
      @items = @items.where fat_type: params[:Fats]
      if !(Item.all.where fat_type: params[:Fats]).exists? 
        @warning += "Sorry.. There is no items having " + params[:Fats] + " amount of Fats | "
        @notification = ""
        @showing_pages = ""
      elsif @items.count > 0
        @notification += "containing " + params[:Fats] + " amount of Fats | "
      end
    end
  end


#Author: Antoine Foti
#Team: 2
#Method name: Filter_5
#Function: It is the fifth part of my filter search. It sorts the items according to a specific attribute
#the user chooses to sort by. It also forms the corresponding messages for the user according to his 
#choice of sorting.
#Parameters: The sort_by value which is selected by the user to make the sorting according to it.
  def filter_5
    if @items.count > 0
      if(params[:sort_by] == "Name" || params[:sort_by].nil?)
        @items = @items.order_by(:name.asc)
        @notification += "Sorted by name | "
      end
      if(params[:sort_by] == "Price")
        @items = @items.order_by(:price.asc)
        @notification += "Sorted by Price | "
      end
      if(params[:sort_by] == "Category")
        @items = @items.order_by(:category.asc)
        @notification += "Sorted by Category | "
      end
      if(params[:sort_by] == "Rating")
        @items = @items.order_by(:rating.asc)
        @notification += "Sorted by Rating | "
      end
      if(params[:sort_by] == "Vitamin_A")
        @items = @items.order_by(:vitamin_a.asc)
        @notification += "Sorted by Vitamin_A | "
      end
      if(params[:sort_by] == "Vitamin_B")
        @items = @items.order_by(:vitamin_b.asc)
        @notification += "Sorted by Vitamin_B | "
      end
      if(params[:sort_by] == "Vitamin_C")
        @items = @items.order_by(:vitamin_c.asc)
        @notification += "Sorted by Vitamin_C | "
      end
      if(params[:sort_by] == "Vitamin_D")
        @items = @items.order_by(:vitamin_d.asc)
        @notification += "Sorted by Vitamin_D | "
      end
      if(params[:sort_by] == "Vitamin_E")
        @items = @items.order_by(:vitamin_e.asc)
        @notification += "Sorted by Vitamin_E | "
      end
      if(params[:sort_by] == "Vitamin_K")
        @items = @items.order_by(:vitamin_k.asc)
        @notification += "Sorted by Vitamin_K | "
      end
      if(params[:sort_by] == "Proteins")
        @items = @items.order_by(:protein.asc)
        @notification += "Sorted by Proteins | "
      end
      if(params[:sort_by] == "Carbohydrate")
        @items = @items.order_by(:carbohydrate.asc)
        @notification += "Sorted by Carbohydrate | "
      end
      if(params[:sort_by] == "Calcium")
        @items = @items.order_by(:calcium.asc)
        @notification += "Sorted by Calcium | "
      end
      if(params[:sort_by] == "Fats")
        @items = @items.order_by(:fat.asc)
        @notification += "Sorted by Fats | "
      end
    end
      @notification = @notification.chop.chop
      @warning = @warning.chop.chop
      @type_warning = @type_warning.chop.chop
    end
  end


  #Author: Sameh Metias
  #team: 3
  #function: retreives all teh items in the instance variable @items in order to show the items from
  #the member point of view

  #AUTHOR: Mahmoud Eldesouky
  #Team: 5
  #Method name: members_items_index
  #Function: sends the message that is set by def Add to the members_item_index view
  #Parameter : flag, message
  def members_items_index
    gon.flag = flash[:flag]
    gon.message = flash[:message]
#Author: Antoine Foti
#Team: 2
#Function: After adding the filter search, it retreives all the required items in the instance variable @items after
#filtering them according to the different fields the user would like to filter on in order to show the desired items 
#from the member point of view. 
#And if the user leaves any field empty without specifying what to filter, it will not be considered as a value and 
#the filter search will be calculated according to the remaining non-empty filtering fields.
#And since the filter methods were divided above; here I call them in the correct order to execute the filter 
#according to the choice of the user.

      filter_1
      filter_2
      filter_3
      filter_4
      filter_5

    user = current_member
    if current_member.email != 'healthygrocery@gmail.com'
    healthrecord = user.records.first
  if(!healthrecord.acceptable_fat_per_week.nil? &&
    !healthrecord.acceptable_calcium_per_week.nil? &&
    !healthrecord.acceptable_carbohydrate_per_week.nil? &&
    !healthrecord.acceptable_protein_per_week.nil? &&
    !healthrecord.acceptable_vitamin_a_per_week.nil? &&
    !healthrecord.acceptable_vitamin_b_per_week.nil? &&
    !healthrecord.acceptable_vitamin_c_per_week.nil? &&
    !healthrecord.acceptable_vitamin_d_per_week.nil? &&
    !healthrecord.acceptable_vitamin_e_per_week.nil? &&
    !healthrecord.acceptable_vitamin_k_per_week.nil?)

    #AUTHOR: Mahmoud Eldesouky
    #Team: 5
    #Method name: members_items_index
    #Function: takes the updated value of each nutriant after adding an item to the shopping card, to reflect and show the
    #new progress of each nutriant on each progress bar and calcultes the overal all progress percentage
    user = current_member
    healthrecord = user.records.first
    @over_all_bar = (((healthrecord.protein_till_now + healthrecord.carbohydrate_till_now + healthrecord.calcium_till_now
                       + healthrecord.fat_till_now + healthrecord.vitamin_a_till_now + healthrecord.vitamin_b_till_now
                       + healthrecord.vitamin_c_till_now + healthrecord.vitamin_d_till_now + healthrecord.vitamin_e_till_now
                       + healthrecord.vitamin_k_till_now) / (healthrecord.acceptable_protein_per_week + healthrecord.acceptable_carbohydrate_per_week
                       + healthrecord.acceptable_calcium_per_week + healthrecord.acceptable_fat_per_week
                       + healthrecord.acceptable_vitamin_a_per_week + healthrecord.acceptable_vitamin_b_per_week
                       + healthrecord.acceptable_vitamin_c_per_week + healthrecord.acceptable_vitamin_d_per_week
                       + healthrecord.acceptable_vitamin_e_per_week + healthrecord.acceptable_vitamin_k_per_week)) * 100)
    @protein_bar = (healthrecord.protein_till_now / healthrecord.acceptable_protein_per_week) * 100
    @carbohydrate_bar = (healthrecord.carbohydrate_till_now / healthrecord.acceptable_carbohydrate_per_week) * 100
    @calcium_bar = (healthrecord.calcium_till_now / healthrecord.acceptable_calcium_per_week) * 100
    @fats_bar = (healthrecord.fat_till_now / healthrecord.acceptable_fat_per_week) * 100
    @vitamin_a_bar = (healthrecord.vitamin_a_till_now / healthrecord.acceptable_vitamin_a_per_week) * 100
    @vitamin_b_bar = (healthrecord.vitamin_b_till_now / healthrecord.acceptable_vitamin_b_per_week) * 100
    @vitamin_c_bar = (healthrecord.vitamin_c_till_now / healthrecord.acceptable_vitamin_c_per_week) * 100
    @vitamin_d_bar = (healthrecord.vitamin_d_till_now / healthrecord.acceptable_vitamin_d_per_week) * 100
    @vitamin_e_bar = (healthrecord.vitamin_e_till_now / healthrecord.acceptable_vitamin_e_per_week) * 100
    @vitamin_k_bar = (healthrecord.vitamin_k_till_now / healthrecord.acceptable_vitamin_k_per_week) * 100
  end
  end
  end

  #AUTHOR: Mahmoud Eldesouky
  #Team: 5
  #Method name: members_items_index
  #Function: This method calls the add method which is in the Item model and send to the methods its needed paramters. It then
  # takes the array returned from the method (which contains the flag and the message to be flushed) and the flushes the message.
  def add
    x = Array.new
    x = Item.add(current_member,params[:item],params[:amount])
    @flag = x[0]
    @message = x[1]
    flash[:flag] = @flag
      #Author: Abdelrahman Sakr
      #Team: 1
      #Function: The following "if condition" checks if there are no violations found then the item will be
      #added to the user's shopping cart, else a popup message will appear without adding the item
      #to the cart.
      if @flag
          redirect_to addtocart_path(:itemidnew => params[:item], :amountnew => params[:amount].to_i)
      elsif
          flash[:message] = @message
          redirect_to :action => :members_items_index
      end
  end

  #Author: Abdelrahman Sakr
  #Team: 1
  #Method: make_discount
  #Function: This method redirects to the make_discount method in item model to apply discount
  def make_discount
      redirect_to edit_item_path(Item.make_discount(params[:discount_item_id],params[:discount_amount]))
  end   
  #Author: Abdelrahman Sakr
  #Team: 1
  #Method: remove_discount
  #Function: This method redirects to the remove_discount method in item model to remove discount
  def remove_discount
      redirect_to edit_item_path(Item.remove_discount(params[:discount_item_id]))
  end
end
