class DiseasesController < ApplicationController
  # GET /diseases
  # GET /diseases.json

  #Author: Jihan Adel 
  #Team: 5
  #method name: index
  #function: represent all the diseases in the database with their attributes and the options to 
  #  show, edit or destroy one of them
  #paramters: none
  def index
    @diseases = Disease.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @diseases }
    end
  end

  # GET /diseases/1
  # GET /diseases/1.json

  #Author: Jihan Adel 
  #Team: 5
  #method name: show
  #function: represent the chosen diseases with its attributes and the options to edit or destroy it
  #paramters: the id of the specific disease
  def show
    @disease = Disease.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @disease }
    end
  end

  # GET /diseases/new
  # GET /diseases/new.json
  #Author: Jihan Adel 
  #Team: 5
  #method name: new
  #function: creates a new disease
  #paramters: none
  def new
    @disease = Disease.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @disease }
    end

  end

  # GET /diseases/1/edit
  def edit
    @disease = Disease.find(params[:id])


  end

  # POST /diseases
  # POST /diseases.json

  #Author: Jihan Adel 
  #Team: 5
  #method name: create
  #function: creates a new disease with its name, information, new nutrition values for the patients,
  #  recommended and restricted items with consderation to the following cases:
  # 1- name of the disease must be entered and must be unique "to prevent duplictes"
  # 2- the admin can`t choose the same item in both recommended and restricted items
  # 3- the admin can skip choosing the recommended and restricted items at creation,he can add them later
  # 4- the admin can`t raise and drop the value of specific nutritional element at the same tme
  #paramters:
  #  name of the new disease "from the textfield"
  #  information about the new disease "from the textfield" 
  #  array ii - contains the ids of the recommended items "from the checkboxes"
  #  array  r - contains the ids of the restricted items "from the checkboxes"            
  #  the added/subtracted value from the average nutritional elements "from the textfields"
  def create
    @disease = Disease.new(params[:disease])
    both = false
    fats_up = params[:fat_up].to_i
    fats_down = params[:fat_down].to_i
    if (fats_up != 0 && fats_down != 0)
      both = true
    elsif fats_up != 0
        @disease.fat =  fats_up
        @disease.save
     else   
        @disease.fat = 0 - fats_down
        @disease.save
    end

    @reco = params[:ii]
    @rest = params[:r]
    @flag = true

    if @reco != nil
        @reco.each do |s| 
          if (@rest != nil && @rest.include?(s))
             @flag = false
          end
        end
    end

    if @flag
      if @reco != nil
          @disease.recommended_items << Item.find(@reco.first)
          @disease.save
          @reco.each do |p|
            @disease.recommended_items << Item.find(p)
            @disease.save
          end 
      end
    
      if @rest != nil 
          @disease.restricted_items << Item.find(@rest.first)
          @disease.save
          @rest.each do |f|
            @disease.restricted_items << Item.find(f)
            @disease.save
          end
      end
    end     
    
    respond_to do |format|
      if both
        @disease.errors.add(:vaules, "should be either raised up or dropped down, not both! ")
        format.html { render action: "new" }
        format.json { render json: @disease.errors, status: :unprocessable_entit}
      elsif (!@flag)
        @disease.errors.add(:same_item, "can`t be picked for both recommended and restricted items")
        format.html { render action: "new" }
        format.json { render json: @disease.errors, status: :unprocessable_entity }
        
      elsif (@disease.save)
        format.html { redirect_to diseases_url }
        format.json { head :no_content }
        
      else 
        format.html { render action: "new" }
        format.json { render json: @disease.errors, status: :unprocessable_entity }
      end
    end
  end 

  # PUT /diseases/1
  # PUT /diseases/1.json

  #Author: Jihan Adel 
  #Team: 5
  #method name: update
  #function: updates a disease with consderation to the same conditions in creation in addition to 
  #  automatically check the previously choosen recommended and restricted items and display the exisiting
  #  values which raised/dropped from the average nutritional elements
  #paramters:
  #  the new name of the disease "from the textfield"
  #  the new information about the disease "from the textfield" 
  #  array ii - contains the ids of the new recommended items "from the checkboxes"
  #  array  r - contains the ids of the new restricted items "from the checkboxes"     
  #  the added/subtracted value from the average nutritional elements "from the textfields"
  def update
    @disease = Disease.find(params[:id])
    @disease.fat = 0
    both = false
    fats_up = params[:fat_up].to_i
    fats_down = params[:fat_down].to_i
    if (fats_up != 0 && fats_down != 0)
      both = true
    elsif fats_up != 0
        @disease.fat =  fats_up
        @disease.save
    else   
        @disease.fat = 0 - fats_down
        @disease.save
    end
    @reco = params[:ii]
    @rest = params[:r]
    @flag = true
    @disease.recommended_items = []
    @disease.restricted_items = []

    if @reco != nil
        @reco.each do |s| 
          if (@rest != nil && @rest.include?(s))
             @flag = false
          end
        end
    end

    if @flag
      if @reco != nil
          @disease.recommended_items << Item.find(@reco.first)
          @disease.save
          @reco.each do |p|
            @disease.recommended_items << Item.find(p)
            @disease.save
          end 
      end
    
      if @rest != nil 
          @disease.restricted_items << Item.find(@rest.first)
          @disease.save
          @rest.each do |f|
            @disease.restricted_items << Item.find(f)
            @disease.save
          end
      end
    end     
    
    respond_to do |format|
      if both
        @disease.errors.add(:vaules, "should be either raised up or dropped down, not both! ")
        format.html { render action: "edit" }
        format.json { render json: @disease.errors, status: :unprocessable_entit}
      elsif (!@flag)
        @disease.errors.add(:same_item, "can`t be picked for both recommended and restricted items")
        format.html { render action: "edit" }
        format.json { render json: @disease.errors, status: :unprocessable_entity }
        
      elsif (@disease.save)
        format.html { redirect_to diseases_url }
        format.json { head :no_content }
        
      else 
        format.html { render action: "edit" }
        format.json { render json: @disease.errors, status: :unprocessable_entity }
      end
    end
  end 

  # DELETE /diseases/1
  # DELETE /diseases/1.json
  #Author: Jihan Adel 
  #Team: 5
  #method name: destroy
  #function: deletes a specific disease from the database
  #paramters: the id of the specific disease
  def destroy
    @disease = Disease.find(params[:id])
    @disease.destroy

    respond_to do |format|
      format.html { redirect_to diseases_url }
      format.json { head :no_content }
    end
  end
end
