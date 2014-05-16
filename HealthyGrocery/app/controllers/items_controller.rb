  class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  # shows all the items in the table item
  def index
    if current_member.email == 'admin@gmail.com'
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
  #Method_Name: toggle_pause
  #What does it do? It simply finds that specific item that needs to be paused and pauses
  # it if the conditions applies that the item is not out of stock.
  def toggle_pause
    flash[:notice] = Item.toggle_pause(params[:id])
    redirect_to items_url
  end

  #Author: Hazem Amin
  #Component: 5
  #Method_Name: create
  #Funtion: It simply CEATES an item, as being one of the 4 fundumentals of CRUD.
  #What about the part commented below? I decide the initial values of paused when it is
  #created, whether it should be initially paused or resumed.
  #if @item.amount <= 0
  #@item.paused = true
  #else
  #@item.paused = false
  #end
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
    gon.flag =  flash[:flag]
    gon.message =  flash[:message]
    #Author: Antoine Foti
    #Team: 2
    #Function: After adding the filter search, it retreives all the required items in the instance variable @items after
    #filtering them according to the different fields the user would like to filter on in order to show the desired items
    #from the member point of view.
    #And if the user leaves any field empty without specifying what to filter, it will not be considered as a value and
    #the filter search will be calculated according to the remaining non-empty filtering fields.
    if (params[:status] == 'available')
      @items = Item.where :name => params[:name], :category => params[:category], :price => params[:price], :rating => params[:rating], :status => true
      if (params[:name] == '')
        @items = Item.where :category => params[:category], :price => params[:price], :rating => params[:rating], :status => true
      end
      if (params[:category] == '')
        @items = Item.where :name => params[:name], :price => params[:price], :rating => params[:rating], :status => true
      end
      if (params[:price] == '')
        @items = Item.where :category => params[:category], :name => params[:name], :rating => params[:rating], :status => true
      end
      if (params[:rating] == '')
        @items = Item.where :category => params[:category], :name => params[:name], :price => params[:price], :status => true
      end
      if (params[:name] == '') && (params[:category] == '')
        @items = Item.where :rating => params[:rating], :price => params[:price], :status => true
      end
      if (params[:name] == '') && (params[:price] == '')
        @items = Item.where :rating => params[:rating], :category => params[:category], :status => true
      end
      if (params[:name] == '') && (params[:rating] == '')
        @items = Item.where :category => params[:category], :price => params[:price], :status => true
      end
      if (params[:category] == '') && (params[:price] == '')
        @items = Item.where :name => params[:name], :rating => params[:rating], :status => true
      end
      if (params[:category] == '') && (params[:rating] == '')
        @items = Item.where :name => params[:rating], :price => params[:price], :status => true
      end
      if (params[:price] == '') && (params[:rating] == '')
        @items = Item.where :name => params[:name], :category => params[:category], :status => true
      end
      if (params[:name] == '') && (params[:category] == '') && (params[:price] == '')
        @items = Item.where :rating => params[:rating], :status => true
      end
      if (params[:name] == '') && (params[:category] == '') && (params[:rating] == '')
        @items = Item.where :price => params[:price], :status => true
      end
      if (params[:name] == '') && (params[:rating] == '') && (params[:price] == '')
        @items = Item.where :category => params[:category], :status => true
      end
      if (params[:rating] == '') && (params[:category] == '') && (params[:price] == '')
        @items = Item.where :name => params[:name], :status => true
      end
      if (params[:name] == '') && (params[:category] == '') && (params[:price] == '') && (params[:rating] == '')
        @items = Item.where :status => true
      end
    else
      @items = Item.where :name => params[:name], :category => params[:category], :price => params[:price], :rating => params[:rating]
      if (params[:name] == '')
        @items = Item.where :category => params[:category], :price => params[:price], :rating => params[:rating]
      end
      if (params[:category] == '')
        @items = Item.where :name => params[:name], :price => params[:price], :rating => params[:rating]
      end
      if (params[:price] == '')
        @items = Item.where :category => params[:category], :name => params[:name], :rating => params[:rating]
      end
      if (params[:rating] == '')
        @items = Item.where :category => params[:category], :name => params[:name], :price => params[:price]
      end
      if (params[:name] == '') && (params[:category] == '')
        @items = Item.where :rating => params[:rating], :price => params[:price]
      end
      if (params[:name] == '') && (params[:price] == '')
        @items = Item.where :rating => params[:rating], :category => params[:category]
      end
      if (params[:name] == '') && (params[:rating] == '')
        @items = Item.where :category => params[:category], :price => params[:price]
      end
      if (params[:category] == '') && (params[:price] == '')
        @items = Item.where :name => params[:name], :rating => params[:rating]
      end
      if (params[:category] == '') && (params[:rating] == '')
        @items = Item.where :name => params[:rating], :price => params[:price]
      end
      if (params[:price] == '') && (params[:rating] == '')
        @items = Item.where :name => params[:name], :category => params[:category]
      end
      if (params[:name] == '') && (params[:category] == '') && (params[:price] == '')
        @items = Item.where :rating => params[:rating]
      end
      if (params[:name] == '') && (params[:category] == '') && (params[:rating] == '')
        @items = Item.where :price => params[:price]
      end
      if (params[:name] == '') && (params[:rating] == '') && (params[:price] == '')
        @items = Item.where :category => params[:category]
      end
      if (params[:rating] == '') && (params[:category] == '') && (params[:price] == '')
        @items = Item.where :name => params[:name]
      end
      if (params[:name] == '' || params[:name].nil?) && (params[:category] == '' || params[:category].nil?) && (params[:price] == '' || params[:price].nil?) && (params[:rating] == '' || params[:rating].nil?)
        @items = Item.all
      end
    end
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

  #AUTHOR: Mahmoud Eldesouky
  #Team: 5
  #Method name: members_items_index
  #Function: This method calls the add method which is in the Item model and send to the methods its needed paramters. It then
  # takes the array returned from the method (which contains the flag and the message to be flushed) and the flushes the message.
  def add
    x = Array.new
    x = Item.add(current_member,params[:item],params[:amount])
    @flag =  x[0]
    @message = x[1]
    flash[:flag] = @flag
    flash[:message] = @message
    redirect_to :action => :members_items_index

  end
end
