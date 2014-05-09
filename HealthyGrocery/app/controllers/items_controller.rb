class ItemsController < ApplicationController
  # (GUI TEAM) This line is made so that the /items does not follow bootstrap
  layout false
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


  def toggle_pause
    @item = Item.find(params[:id])

    if @item.amount <= 0 && @item.paused == false 
      flash[:notice] = "Can't resume because stock equals #{@item.amount}"
    else 
      @item.paused = !@item.paused
      @item.save
      flash[:notice] = "Item toggled successfully"
    end

    redirect_to items_url
  end
  #Author: Hazem Amin
  #Method_Name: toggle_pause
  #What does it do? It simply finds that specific item that needs to be paused and pauses
  # it if the conditions applies that the item is not out of stock.
  #Author: Hazem Amin
  #Method_Name: toggle_pause
  #What does it do? It simply finds that specific item that needs to be paused and pauses
  # it if the conditions applies that the item is not out of stock.
  
 def create
  @item = Item.new(params[:item])

    # initial value of paused
  if @item.amount <= 0
   @item.paused = false
  else 
   @item.paused = true
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
  #Author: Hazem Amin
  #Component: 5
  #Method_Name: create
  #What does it do? It simply CEATES an item, as being one of the 4 fundumentals of CRUD.
  #What about the part commented below? I decide the initial values of paused when it is 
  # created, whether it should be initially paused or resumed.
  #    if @item.amount <= 0
  #    @item.paused = true
  #  else 
  #    @item.paused = false
  #  end

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

def is_a_number?(s)
  s.to_s.match(/\A[+-]?\d+?(\.\d+)?\Z/) == nil ? false : true
end

#Author: Sameh Metias
#team: 3
#function: retreives all teh items in the instance variable @items in order to show the items from
#the member point of view 

#AUTHOR: Mahmoud Eldesouky
#Team :5
#parameter : flag, message
#sends the message that is set by def Add to the members_item_index view
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

    @items = Item.all
    @notification = ""
    @warning = ""
    @type_warning = "" 
    if Item.all.count > 0
    if (params[:status] == 'available' && @items.count > 0)
      @items = @items.where :status => true
      if !(Item.all.where :status => true).exists?
          @warning += "Sorry..There is nothing available | "
        else
          @notification += "Showing available products only | "
        end
      else
        @notification += "Showing available & not available products | " 
    end
    if (params[:name] != '' && !params[:name].nil? && @items.count > 0)
      if !is_a_number?(params[:name])
        @items = @items.where :name => Regexp.new(params[:name])
      if !(Item.all.where :name => Regexp.new(params[:name])).exists?
          @warning += "Sorry..There is no such name " + params[:name] + " | "
          @notification = ""
        else 
          @notification += "Showing results for " + params[:name] + " | "
        end
      else
      @type_warning += "Please choose correct characters for searching the name | " 
    end
    end
    if (params[:category] != '<None>' && !params[:category].nil? && @items.count > 0)
      @items = @items.where :category => params[:category]
      if !(Item.all.where :category => params[:category]).exists?
          @warning += "Sorry..There is no items in this category | "
          @notification = ""
        else
          @notification += "Items in " + params[:category] + "'s category | "
        end
      end
    if (params[:price_from] != '' && !params[:price_from].nil? && @items.count > 0)
      if is_a_number?(params[:price_from])
        @items = @items.where :price.gte => params[:price_from]
      if !(Item.all.where :price.gte => params[:price_from]).exists?
          @warning += "Sorry..There is no items starting from " + params[:price_from] + "$ | "
          @notification = ""
        else
          @notification += "Starting from " + params[:price_from] + "$ | "
        end
    else
      @type_warning += "Please choose a number for the starting price | "
    end
    end
    if (params[:price_to] != '' && !params[:price_to].nil? && @items.count > 0)
      if is_a_number?(params[:price_to])
        @items = @items.where :price.lte => params[:price_to]
      if !(Item.all.where :price.lte => params[:price_to]).exists?
          @warning += "Sorry..There is no items below " + params[:price_to] + "$ | "
          @notification = ""
        else
          @notification += "Going to " + params[:price_to] + "$ | "
        end
    else
      @type_warning += "Please choose a number for the ending price | " 
    end
    end
    if (params[:rating_from] != '' && !params[:rating_from].nil? && @items.count > 0)
      if is_a_number?(params[:rating_from])
        @items = @items.where :rating.gte => params[:rating_from]
      if !(Item.all.where :rating.gte => params[:rating_from]).exists?
          @warning += "Sorry..There is no rating starting from " + params[:rating_from] + " rate(s) | "
          @notification = ""
        else
          @notification += "Starting from " + params[:rating_from] + "rate(s) | "
        end
    else
      @type_warning += "Please choose a number for the starting rating | "
    end
    end
    if (params[:rating_to] != '' && !params[:rating_to].nil? && @items.count > 0)
      if is_a_number?(params[:rating_to])
        @items = @items.where :rating.lte => params[:rating_to]
      if !(Item.all.where :rating.lte => params[:rating_to]).exists?
          @warning += "Sorry..There is no items below " + params[:rating_to] + " rate(s) | "
          @notification = ""
        else
          @notification += "Going to " + params[:rating_to] + "rate(s) | "
        end
    else
      @type_warning += "Please choose a number for the ending rating | "
    end
    end
    if(params[:sort_by] == "Name" || params[:sort_by].nil? && @items.count > 0)
      @items = @items.order_by(:name.asc)
    end
    if(params[:sort_by] == "Price")
      @items = @items.order_by(:price.asc)
    end
    if(params[:sort_by] == "Category")
      @items = @items.order_by(:category.asc)
    end

    @notification = @notification.chop.chop
    @warning = @warning.chop.chop
    @type_warning = @type_warning.chop.chop
    @items = @items.page(params[:page]).per(5)

  end
    
    
    
  end
   
    #AUTHOR: Mahmoud Eldesouky
    #Team :5
    #parameter : item, amount
    #checks that the choosen item with its nutrition does not exceed the acceptable limit of 
    #this user nutrients that we keep track of through his healthrecord. Each time an item within the 
    #nutrition limits is choosen his till_now attribute in the healthrecord is updated else if a violation happens
    #the message attribute is set with the approprite message to the user describing his violations
   def add

    item_id = params[:item]
    amount = params[:amount].to_i 
    item =  Item.where(id:  item_id).first

 if item.amount > 0
    user = current_member
    healthrecord =  user.records.first
     
    if  healthrecord.blank? 
    @message = "Please fill your health record before ordering"
    @flag = false
    flash[:message] = @message 
    flash[:flag] = @flag
    redirect_to :action => :members_items_index
    return 
    end 

    @flag = true
    @message = "This request with its quantity exceeds the acceptable range of the following: "
    v_counter=1

  if  healthrecord.acceptable_protein_per_week < ( (item.protein * amount )+  healthrecord.protein_till_now)
    @message = @message+v_counter.to_s+".proteins "
    v_counter = v_counter+1
    @flag = false
  end  
  if  healthrecord.acceptable_carbohydrate_per_week < ( (item.carbohydrate * amount) +  healthrecord.carbohydrate_till_now)
    @message = @message + v_counter.to_s+".carbohydrates "
    v_counter = v_counter+1
    @flag = false
  end
  if  healthrecord.acceptable_calcium_per_week < ( (item.calcium * amount)+  healthrecord.calcium_till_now)
    @message = @message +v_counter.to_s+ ".calcium "
    v_counter = v_counter+1
    @flag = false
  end    
  if healthrecord.acceptable_fat_per_week < ( (item.fat * amount) +  healthrecord.fat_till_now) 
    @message = @message +v_counter.to_s+ ".fats"
    v_counter = v_counter+1
    @flag = false
  end
  if (amount === 0 )
    @flag = false 
    @message = "please enter the quantity"
  end 

  if  @flag   
  
    protein =  healthrecord.protein_till_now +  (item.protein * amount )
    carbohydrate =  healthrecord.carbohydrate_till_now +  (item.carbohydrate * amount)
    calcium  =   healthrecord.calcium_till_now +  (item.calcium * amount)
    fat  =   healthrecord.fat_till_now +  (item.fat * amount) 

    Member.where(id: user.id).first.records.update(protein_till_now: protein)
    Member.where(id: user.id).first.records.update(carbohydrate_till_now: carbohydrate)
    Member.where(id: user.id).first.records.update(calcium_till_now: calcium)
    Member.where(id: user.id).first.records.update(fat_till_now: fat)
 
 end 
    else
    @message = "Sorry! This item is not available in stock"
     
    end
    flash[:message] = @message 
    flash[:flag] = @flag
    redirect_to :action => :members_items_index
 end

end
