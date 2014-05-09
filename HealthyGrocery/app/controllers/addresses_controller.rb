class AddressesController < ApplicationController
  # GET /addresses
  # GET /addresses.json
  def index
    @addresses = Address.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @addresses }
    end
  end

  # GET /addresses/1
  # GET /addresses/1.json
  def show
    @address = Address.find(params[:id])
      
      # Author: Karim El-Bawab
      # Team: 4
      # Function: this block of code below is used in order to show
      # a map with a marker set on the user address 

      @hash = Gmaps4rails.build_markers(@address) do |address, marker|
      
        marker.lat address.coordinates[1]
        marker.lng address.coordinates[0]
      
    end  
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @address }
    end
  end

  # GET /addresses/new
  # GET /addresses/new.json
  def new
    @address = Address.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @address }
    end
  end

  # GET /addresses/1/edit
  def edit
    @address = Address.find(params[:id])
  end

  # POST /addresses
  # POST /addresses.json
  def create
    @address = Address.new(params[:address])

    respond_to do |format|
      if @address.save
      # Author: Mahmoud Walid
      # Team: 3
      # Function: adding the created address to the list of addresses of the signed in user
        current_member.addresses.push(@address)
        format.html { redirect_to addressesposition_path(@address.id) }
        format.json { render json: @address, status: :created, location: @address }
      else
        format.html { render action: "new" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /addresses/1
  # PUT /addresses/1.json
  def update
    @address = Address.find(params[:id])

    respond_to do |format|
      if @address.update_attributes(params[:address])
        format.html { redirect_to addressesposition_path(@address.id)}
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /addresses/1
  # DELETE /addresses/1.json
  def destroy
    @address = Address.find(params[:id])
    @address.destroy

    respond_to do |format|
      format.html { redirect_to showaddresses_path }
      format.json { head :no_content }
    end
  end
  # Author: Karim El-Bawab
  # Team: 4
  # Method: position
  # Parameters: There are 3 parameters that passed to its view : the
  # current member id , the latiude and longitude (both latiude and 
  # longitude passed using gon gem to be able to use them into javascript
  # code)
  # Function: this action is used to give the user the ability to set
  # his address in the map using the marker 
  def position
    @address = Address.find(params[:id])
  
    gon.lat = @address.coordinates[1]
    gon.lng = @address.coordinates[0]  
   
  end
end
