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

  # POST /items
  # POST /items.json
  # takes unsaved record from new , checks for validations then saves if success
  def create
    @item = Item.new(params[:item])

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
#Team :5
#parameter : flag, message
#sends the message that is set by def Add to the members_item_index view
  def members_items_index    

   gon.flag =  flash[:flag]
   gon.message =  flash[:message]

   @items = Item.all    
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
 if  item.amount > 0
        user = current_member
        healthrecord =  user.records.first
        
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
  if  healthrecord.acceptable_fat_per_week < ( (item.fat * amount) +  healthrecord.fat_till_now) 
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
