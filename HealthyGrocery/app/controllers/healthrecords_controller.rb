class HealthrecordsController < ApplicationController
  # GET /healthrecords
  # GET /healthrecords.json


#Author : mina sedra
#team : 2
#method: index
#params : none
#it shows all the  healthrecord in the database
  def index
    @healthrecords = Healthrecord.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @healthrecords }
    end
  end

  # GET /healthrecords/1
  # GET /healthrecords/1.json
#Author : mina sedra
#team : 2
#method: show
#params : none
#it shows  the  healthrecord in details

  def show
    @healthrecord = Healthrecord.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @healthrecord }
    end
  end

  # GET /healthrecords/new
  # GET /healthrecords/new.json
  #Author : mina sedra
#team : 2
#method: index
#params : none
#render the form to create new healthrecord
  def new
    @healthrecord = Healthrecord.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @healthrecord }
    end
  end

  # GET /healthrecords/1/edit
#Author : mina sedra
#team : 2
#method: index
#params : none
#render the form to edit that healthrecord
  def edit
    @healthrecord = Healthrecord.find(params[:id])
  end

  # POST /healthrecords
  # POST /healthrecords.json
#Author : mina sedra
#team : 2
#method: index
#params : none
#create new healthrecord for a member 
  def create
    @healthrecord = Healthrecord.new(params[:healthrecord])

    respond_to do |format|
      if @healthrecord.save
        current_member.records.push(@healthrecord)
        format.html { redirect_to @healthrecord, notice: 'Healthrecord was successfully created.' }
        format.json { render json: @healthrecord, status: :created, location: @healthrecord }
      else
        format.html { render action: "new" }
        format.json { render json: @healthrecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /healthrecords/1
  # PUT /healthrecords/1.json
  #Author : mina sedra
#team : 2
#method: index
#params : none
#update healthrecord
  def update
    @healthrecord = Healthrecord.find(params[:id])

    respond_to do |format|
      if @healthrecord.update_attributes(params[:healthrecord])
        format.html { redirect_to @healthrecord, notice: 'Healthrecord was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @healthrecord.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /healthrecords/1
  # DELETE /healthrecords/1.json
  #Author : mina sedra
#team : 2
#method: index
#params : none
#delete healthrecord
  def destroy
    @healthrecord = Healthrecord.find(params[:id])
    @healthrecord.destroy

    respond_to do |format|
      format.html { redirect_to healthrecords_url }
      format.json { head :no_content }
    end
  end
end
