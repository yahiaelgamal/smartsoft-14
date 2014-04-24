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

#Author: Sameh Metias
#team: 3
#function: retreives all teh items in the instance variable @items in order to show the items from
#the member point of view 
  def members_items_index
    @items = Item.all
  end
end
