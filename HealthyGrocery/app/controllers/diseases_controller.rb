class DiseasesController < ApplicationController
# GET /diseases
# GET /diseases.json

#Author: Jihan Adel
#Team: 5
#Method name: index
#Function: represent all the diseases in the database with their attributes and the options to
#show, edit or destroy one of them
#Paramters: none
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
#Method name: show
#Function: represent the chosen diseases with its attributes and the options to edit or destroy it
#Paramters: the id of the specific disease
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
#Method name: new
#Function: creates a new disease
#Paramters: none
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
  #Method name: create
  #Function: creates a new disease with its name, information, new nutrition values for the patients,
  #  recommended and restricted items with consderation to the following cases:
  # 1- name of the disease must be entered and must be unique "to prevent duplictes"
  # 2- the admin can`t raise and drop the value of specific nutritional element at the same tme
  # 3- the nutritional values must be in a numeric form
  #Paramters:
  #  name of the new disease "from the textfield"
  #  information about the new disease "from the textfield"
  #  array checked_recommended - contains the ids of the recommended items "from the checkboxes"
  #  array  checked_restricted - contains the ids of the restricted items "from the checkboxes"
  #  the added/subtracted value from the average nutritional elements "from the textfields"
  def create
    @disease = Disease.new(params[:disease])

    @reco = params[:ii]
    @rest = params[:r]
    @flag = true
    @disease.date = Date.today

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
    

    both = false
    not_number = false
    fats_up = params[:fat_up].to_i
    fats_down = params[:fat_down].to_i
    if ((fats_up == 0 && params[:fat_up] != '0') || (fats_down == 0 && params[:fat_down] != '0'))
      not_number = true
    elsif(!not_number)
      if (fats_up != 0 && fats_down != 0)
        both = true
      elsif fats_up != 0
        @disease.fat =  fats_up
        @disease.save
      else
        @disease.fat = 0 - fats_down
        @disease.save
      end
    end
    proteins_up = params[:protein_up].to_i
    proteins_down = params[:protein_down].to_i
    if ((proteins_up == 0 && params[:protein_up] != '0') || (proteins_down == 0 && params[:protein_down] != '0'))
      not_number = true
    elsif (!not_number)
      if (proteins_up != 0 && proteins_down != 0)
        both = true
      elsif proteins_up != 0
        @disease.protein =  proteins_up
        @disease.save
      else
        @disease.protein = 0 - proteins_down
        @disease.save
      end
    end
    calciums_up = params[:calcium_up].to_i
    calciums_down = params[:calcium_down].to_i
    if ((calciums_up == 0 && params[:calcium_up] != '0') || (calciums_down == 0 && params[:calcium_down] != '0'))
      not_number = true
    elsif(!not_number)
      if (calciums_up != 0 && calciums_down != 0)
        both = true
      elsif calciums_up != 0
        @disease.calcium =  calciums_up
        @disease.save
      else
        @disease.calcium = 0 - calciums_down
        @disease.save
      end
    end
    carbohydrates_up = params[:carbohydrate_up].to_i
    carbohydrates_down = params[:carbohydrate_down].to_i
    if ((carbohydrates_up == 0 && params[:carbohydrate_up] != '0') || (carbohydrates_down == 0 && params[:carbohydrate_down] != '0'))
      not_number = true
    elsif(!not_number)
      if (carbohydrates_up != 0 && carbohydrates_down != 0)
        both = true
      elsif carbohydrates_up != 0
        @disease.carbohydrate =  carbohydrates_up
        @disease.save
      else
        @disease.carbohydrate = 0 - carbohydrates_down
        @disease.save
      end
    end
    vitamin_as_up = params[:vitamin_a_up].to_i
    vitamin_as_down = params[:vitamin_a_down].to_i
    if ((vitamin_as_up == 0 && params[:vitamin_a_up] != '0') || (vitamin_as_down == 0 && params[:vitamin_a_down] != '0'))
      not_number = true
    elsif(!not_number)
      if (vitamin_as_up != 0 && vitamin_as_down != 0)
        both = true
      elsif vitamin_as_up != 0
        @disease.vitamin_a =  vitamin_as_up
        @disease.save
      else
        @disease.vitamin_a = 0 - vitamin_as_down
        @disease.save
      end
    end
    vitamin_bs_up = params[:vitamin_b_up].to_i
    vitamin_bs_down = params[:vitamin_b_down].to_i
    if ((vitamin_bs_up == 0 && params[:vitamin_b_up] != '0') || (vitamin_bs_down == 0 && params[:vitamin_b_down] != '0'))
      not_number = true
    elsif(!not_number)
      if (vitamin_bs_up != 0 && vitamin_bs_down != 0)
        both = true
      elsif vitamin_bs_up != 0
        @disease.vitamin_b =  vitamin_bs_up
        @disease.save
      else
        @disease.vitamin_b = 0 - vitamin_bs_down
        @disease.save
      end
    end
    vitamin_cs_up = params[:vitamin_c_up].to_i
    vitamin_cs_down = params[:vitamin_c_down].to_i
    if ((vitamin_cs_up == 0 && params[:vitamin_c_up] != '0') || (vitamin_cs_down == 0 && params[:vitamin_c_down] != '0'))
      not_number = true
    elsif(!not_number)
      if (vitamin_cs_up != 0 && vitamin_cs_down != 0)
        both = true
      elsif vitamin_cs_up != 0
        @disease.vitamin_c =  vitamin_cs_up
        @disease.save
      else
        @disease.vitamin_c = 0 - vitamin_cs_down
        @disease.save
      end
    end
    vitamin_ds_up = params[:vitamin_d_up].to_i
    vitamin_ds_down = params[:vitamin_d_down].to_i
    if ((vitamin_ds_up == 0 && params[:vitamin_d_up] != '0') || (vitamin_ds_down == 0 && params[:vitamin_d_down] != '0'))
      not_number = true
    elsif(!not_number)
      if (vitamin_ds_up != 0 && vitamin_ds_down != 0)
        both = true
      elsif vitamin_ds_up != 0
        @disease.vitamin_d =  vitamin_ds_up
        @disease.save
      else
        @disease.vitamin_d = 0 - vitamin_ds_down
        @disease.save
      end
    end
    vitamin_es_up = params[:vitamin_e_up].to_i
    vitamin_es_down = params[:vitamin_e_down].to_i
    if ((vitamin_es_up == 0 && params[:vitamin_e_up] != '0') || (vitamin_es_down == 0 && params[:vitamin_e_down] != '0'))
      not_number = true
    elsif(!not_number)
      if (vitamin_es_up != 0 && vitamin_es_down != 0)
        both = true
      elsif vitamin_es_up != 0
        @disease.vitamin_e =  vitamin_es_up
        @disease.save
      else
        @disease.vitamin_e = 0 - vitamin_es_down
        @disease.save
      end
    end
    vitamin_ks_up = params[:vitamin_k_up].to_i
    vitamin_ks_down = params[:vitamin_k_down].to_i
    if ((vitamin_ks_up == 0 && params[:vitamin_k_up] != '0') || (vitamin_ks_down == 0 && params[:vitamin_k_down] != '0'))
      not_number = true
    elsif(!not_number)
      if (vitamin_ks_up != 0 && vitamin_ks_down != 0)
        both = true
      elsif vitamin_ks_up != 0
        @disease.vitamin_k =  vitamin_ks_up
        @disease.save
      else
        @disease.vitamin_k = 0 - vitamin_ks_down
        @disease.save
      end
    end
    @recommended = params[:checked_recommended]
    @restricted = params[:checked_restricted]
    @flag = Disease.check_items(@disease.id,@recommended,@restricted)


    respond_to do |format|
      if not_number
        @disease.destroy
        @disease.errors.add(:vaules, "must be in a numeric form! ")
        format.html { render action: "new" }
        format.json { render json: @disease.errors, status: :unprocessable_entit}
      elsif both
        @disease.destroy
        @disease.errors.add(:vaules, "should be either raised up or dropped down, not both! ")
        format.html { render action: "new" }
        format.json { render json: @disease.errors, status: :unprocessable_entit}
      elsif (!@flag)
        @disease.destroy
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
  #Method name: update
  #Function: updates a disease with consderation to the same conditions in creation in addition to
  #  automatically check the previously choosen recommended and restricted items and display the exisiting
  #  values which raised/dropped from the average nutritional elements
  #Paramters:
  #  the new name of the disease "from the textfield"
  #  the new information about the disease "from the textfield"
  #  array checked_recommended - contains the ids of the new recommended items "from the checkboxes"
  #  array  checked_restricted - contains the ids of the new restricted items "from the checkboxes"
  #  the added/subtracted value from the average nutritional elements "from the textfields"
  def update
    @disease = Disease.find(params[:id])
    @disease.fat = 0
    @disease.calcium = 0
    @disease.carbohydrate = 0
    @disease.protein = 0
    @disease.vitamin_a = 0
    @disease.vitamin_b = 0
    @disease.vitamin_c = 0
    @disease.vitamin_d = 0
    @disease.vitamin_e = 0
    @disease.vitamin_k = 0
    both = false
    not_number = false
    fats_up = params[:fat_up].to_i
    fats_down = params[:fat_down].to_i
    if ((fats_up == 0 && params[:fat_up] != '0') || (fats_down == 0 && params[:fat_down] != '0'))
      not_number = true
    elsif(!not_number)
      if (fats_up != 0 && fats_down != 0)
        both = true
      elsif fats_up != 0
        @disease.fat =  fats_up
        @disease.save
      else
        @disease.fat = 0 - fats_down
        @disease.save
      end
    end
    proteins_up = params[:protein_up].to_i
    proteins_down = params[:protein_down].to_i
    if ((proteins_up == 0 && params[:protein_up] != '0') || (proteins_down == 0 && params[:protein_down] != '0'))
      not_number = true
    elsif (!not_number)
      if (proteins_up != 0 && proteins_down != 0)
        both = true
      elsif proteins_up != 0
        @disease.protein =  proteins_up
        @disease.save
      else
        @disease.protein = 0 - proteins_down
        @disease.save
      end
    end
    calciums_up = params[:calcium_up].to_i
    calciums_down = params[:calcium_down].to_i
    if ((calciums_up == 0 && params[:calcium_up] != '0') || (calciums_down == 0 && params[:calcium_down] != '0'))
      not_number = true
    elsif(!not_number)
      if (calciums_up != 0 && calciums_down != 0)
        both = true
      elsif calciums_up != 0
        @disease.calcium =  calciums_up
        @disease.save
      else
        @disease.calcium = 0 - calciums_down
        @disease.save
      end
    end
    carbohydrates_up = params[:carbohydrate_up].to_i
    carbohydrates_down = params[:carbohydrate_down].to_i
    if ((carbohydrates_up == 0 && params[:carbohydrate_up] != '0') || (carbohydrates_down == 0 && params[:carbohydrate_down] != '0'))
      not_number = true
    elsif(!not_number)
      if (carbohydrates_up != 0 && carbohydrates_down != 0)
        both = true
      elsif carbohydrates_up != 0
        @disease.carbohydrate =  carbohydrates_up
        @disease.save
      else
        @disease.carbohydrate = 0 - carbohydrates_down
        @disease.save
      end
    end
    vitamin_as_up = params[:vitamin_a_up].to_i
    vitamin_as_down = params[:vitamin_a_down].to_i
    if ((vitamin_as_up == 0 && params[:vitamin_a_up] != '0') || (vitamin_as_down == 0 && params[:vitamin_a_down] != '0'))
      not_number = true
    elsif(!not_number)
      if (vitamin_as_up != 0 && vitamin_as_down != 0)
        both = true
      elsif vitamin_as_up != 0
        @disease.vitamin_a =  vitamin_as_up
        @disease.save
      else
        @disease.vitamin_a = 0 - vitamin_as_down
        @disease.save
      end
    end
    vitamin_bs_up = params[:vitamin_b_up].to_i
    vitamin_bs_down = params[:vitamin_b_down].to_i
    if ((vitamin_bs_up == 0 && params[:vitamin_b_up] != '0') || (vitamin_bs_down == 0 && params[:vitamin_b_down] != '0'))
      not_number = true
    elsif(!not_number)
      if (vitamin_bs_up != 0 && vitamin_bs_down != 0)
        both = true
      elsif vitamin_bs_up != 0
        @disease.vitamin_b =  vitamin_bs_up
        @disease.save
      else
        @disease.vitamin_b = 0 - vitamin_bs_down
        @disease.save
      end
    end
    vitamin_cs_up = params[:vitamin_c_up].to_i
    vitamin_cs_down = params[:vitamin_c_down].to_i
    if ((vitamin_cs_up == 0 && params[:vitamin_c_up] != '0') || (vitamin_cs_down == 0 && params[:vitamin_c_down] != '0'))
      not_number = true
    elsif(!not_number)
      if (vitamin_cs_up != 0 && vitamin_cs_down != 0)
        both = true
      elsif vitamin_cs_up != 0
        @disease.vitamin_c =  vitamin_cs_up
        @disease.save
      else
        @disease.vitamin_c = 0 - vitamin_cs_down
        @disease.save
      end
    end
    vitamin_ds_up = params[:vitamin_d_up].to_i
    vitamin_ds_down = params[:vitamin_d_down].to_i
    if ((vitamin_ds_up == 0 && params[:vitamin_d_up] != '0') || (vitamin_ds_down == 0 && params[:vitamin_d_down] != '0'))
      not_number = true
    elsif(!not_number)
      if (vitamin_ds_up != 0 && vitamin_ds_down != 0)
        both = true
      elsif vitamin_ds_up != 0
        @disease.vitamin_d =  vitamin_ds_up
        @disease.save
      else
        @disease.vitamin_d = 0 - vitamin_ds_down
        @disease.save
      end
    end
    vitamin_es_up = params[:vitamin_e_up].to_i
    vitamin_es_down = params[:vitamin_e_down].to_i
    if ((vitamin_es_up == 0 && params[:vitamin_e_up] != '0') || (vitamin_es_down == 0 && params[:vitamin_e_down] != '0'))
      not_number = true
    elsif(!not_number)
      if (vitamin_es_up != 0 && vitamin_es_down != 0)
        both = true
      elsif vitamin_es_up != 0
        @disease.vitamin_e =  vitamin_es_up
        @disease.save
      else
        @disease.vitamin_e = 0 - vitamin_es_down
        @disease.save
      end
    end
    vitamin_ks_up = params[:vitamin_k_up].to_i
    vitamin_ks_down = params[:vitamin_k_down].to_i
    if ((vitamin_ks_up == 0 && params[:vitamin_k_up] != '0') || (vitamin_ks_down == 0 && params[:vitamin_k_down] != '0'))
      not_number = true
    elsif(!not_number)
      if (vitamin_ks_up != 0 && vitamin_ks_down != 0)
        both = true
      elsif vitamin_ks_up != 0
        @disease.vitamin_k =  vitamin_ks_up
        @disease.save
      else
        @disease.vitamin_k = 0 - vitamin_ks_down
        @disease.save
      end
    end
    @disease.recommended_items = []
    @disease.restricted_items = []

    @recommended = params[:checked_recommended]
    @restricted = params[:checked_restricted]
    @flag = Disease.check_items(@disease.id,@recommended,@restricted)

    respond_to do |format|
      if not_number
        @disease.errors.add(:vaules, "must be in a numeric form! ")
        format.html { render action: "edit" }
        format.json { render json: @disease.errors, status: :unprocessable_entit}
      elsif both
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
  #Method name: destroy
  #Function: deletes a specific disease from the database
  #Paramters: the id of the specific disease
  def destroy
    @disease = Disease.find(params[:id])
    @disease.destroy

    respond_to do |format|
      format.html { redirect_to diseases_url }
      format.json { head :no_content }
    end
  end
end
