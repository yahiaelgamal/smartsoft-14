class ItemsController < ApplicationController
  # GET /items
  # GET /items.json
  # shows all the items in the table item
  def index
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
     /Use.where(name: "Ahmed").create/
   /Use.first.records.push(Healthrecord.where(fats: 200).create)/
  / Use.where(name: "Ahmed").first.healthrecord.where(fats: 200).update(height: 170)
    Use.where(name: "Ahmed").first.healthrecord.where(fats: 200).update(weight: 170)
    Use.where(name: "Ahmed").first.healthrecord.where(fats: 200).update(acceptable_protein_per_week: 170)
    Use.where(name: "Ahmed").first.healthrecord.where(fats: 200).update(acceptable_carbohydrate_per_week: 170)
    Use.where(name: "Ahmed").first.healthrecord.where(fats: 200).update(acceptable_calcium_per_week: 170)
    Use.where(name: "Ahmed").first.healthrecord.where(fats: 200).update(acceptable_fat_per_week: 170)
    Use.where(name: "Ahmed").first.healthrecord.where(fats: 200).update(protein_till_now: 170)
    Use.where(name: "Ahmed").first.healthrecord.where(fats: 200).update(carbohydrate_till_now: 170)
    Use.where(name: "Ahmed").first.healthrecord.where(fats: 200).update(calcium_till_now: 170)
    Use.where(name: "Ahmed").first.healthrecord.where(fats: 200).update(fat_till_now: 170)
/
    
   @items = Item.all    
  end
   
   def Add

    item_id = params[:item]
    # @item =  Item.where(id: @item_id).first
    Item.where(id:  item_id).update(protein: 200)
    Item.where(id:  item_id).update(carbohydrate: 200)
    Item.where(id:  item_id).update(calcium: 200)
    Item.where(id:  item_id).first.update(fat: 200)
     item =  Item.where(id:  item_id).first

  #if ( acceptable_protein_per_week <=  item.protein )
  # Item.where(id:  item_id).update(protein: 33333) 
  #else 
  #flash[:notice] = "This request with its quantity exceeds the protein acceptable range"
  # end 
  #  redirect_to :action => :members_items_index
 if  item.amount > 0
        user = Use.first
        healthrecord =  user.records.first

   flag = true
 if  healthrecord.acceptable_protein_per_week < ( item.protein +  healthrecord.protein_till_now)
        flash[:notice] = "This request with its quantity exceeds the proteins acceptable range"
        flag = false
  end  
  if  healthrecord.acceptable_carbohydrate_per_week < ( item.carbohydrate +  healthrecord.carbohydrate_till_now)
        flash[:notice] = "This request with its quantity exceeds the carbohydrates  acceptable range"
        flag = false
  end
  if  healthrecord.acceptable_calcium_per_week < ( item.calcium +  healthrecord.calcium_till_now)
        flash[:notice] = "This request with its quantity exceeds the calcium acceptable range"
        flag = false
  end    
  if  healthrecord.acceptable_fat_per_week < ( item.fat +  healthrecord.fat_till_now) 
        flash[:notice] = "This request with its quantity exceeds the fats acceptable range"
        flag = false
  end
  
  if  flag   
  
      protein =  healthrecord.protein_till_now +  item.protein
      carbohydrate =  healthrecord.carbohydrate_till_now +  item.carbohydrate
      calcium  =   healthrecord.calcium_till_now +  item.calcium
      fat  =   healthrecord.fat_till_now +  item.fat

     Use.where(id: user.id).first.records.update(protein_till_now: protein)
     Use.where(id: user.id).first.records.update(carbohydrate_till_now: carbohydrate)
     Use.where(id: user.id).first.records.update(calcium_till_now: calcium)
     Use.where(id: user.id).first.records.update(fat_till_now: fat)
  
     flash[:notice] = '' + protein.to_s
 end 
    else

         flash[:notice] = "The amount of this is not enough"
          
    end
      
    redirect_to :action => :members_items_index
 end

end
