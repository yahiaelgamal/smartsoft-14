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

def members_items_index
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

  end
  
end
