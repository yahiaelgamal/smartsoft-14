class DiseasesController < ApplicationController
  # GET /diseases
  # GET /diseases.json

  # Author: Ahmed Helali
  # Team: 2
  # Method name: index
  # Function: Get all diseases in the databases
  # Parameters: none

  def index
    @diseases = Disease.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @diseases }
    end
  end

  # GET /diseases/1
  # GET /diseases/1.json

  # Author: Ahmed Helali
  # Team: 2
  # Method name: show
  # Function: Get a specific disease in the databases
  # Parameters: none

  def show
    @disease = Disease.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @disease }
    end
  end

  # GET /diseases/new
  # GET /diseases/new.json

  # Author: Ahmed Helali
  # Team: 2
  # Method name: new
  # Function: sends the user (in this case the retailler)
  # to a the view new in order to create a new disease
  # Parameters: none

  def new
    @disease = Disease.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @disease }
    end
  end

  # GET /diseases/1/edit

  # Author: Ahmed Helali
  # Team: 2
  # Method name: edit
  # Function: send the user (in this case the retailler)
  # to the edit view so he can the update the disease instance
  # Parameters: none

  def edit
    @disease = Disease.find(params[:id])
  end

  # POST /diseases
  # POST /diseases.json
  
  # Author: Ahmed Helali
  # Team: 2
  # Method name: create
  # Function: it takes the input from the new view page
  # and creates the new disease and puts it in the database
  # Parameters: none

  def create
    @disease = Disease.new(params[:disease])

    respond_to do |format|
      if @disease.save
        format.html { redirect_to @disease, notice: 'Disease was successfully created.' }
        format.json { render json: @disease, status: :created, location: @disease }
      else
        format.html { render action: "new" }
        format.json { render json: @disease.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /diseases/1
  # PUT /diseases/1.json

  # Author: Ahmed Helali
  # Team: 2
  # Method name: update
  # Function: takes the input from the edit view 
  # and then update the entry in the database 
  # Parameters: none

  def update
    @disease = Disease.find(params[:id])

    respond_to do |format|
      if @disease.update_attributes(params[:disease])
        format.html { redirect_to @disease, notice: 'Disease was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @disease.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /diseases/1
  # DELETE /diseases/1.json

  # Author: Ahmed Helali
  # Team: 2
  # Method name: show
  # Function: Get a specific disease in the databases
  # Parameters: none

  def destroy
    @disease = Disease.find(params[:id])
    @disease.destroy

    respond_to do |format|
      format.html { redirect_to diseases_url }
      format.json { head :no_content }
    end
  end
end
