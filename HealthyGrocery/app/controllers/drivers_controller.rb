class DriversController < ApplicationController

  def index
    @drivers = Driver.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @drivers }
    end
  end
  #Author: Hazem Amin
  #Component: 5
  #Action_Name: index
  #To view all drivers

  def show
    @driver = Driver.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @driver }
    end
  end
  #Author: Hazem Amin
  #Component: 5
  #Action_Name: show
  #To view a specific driver

  def new
    @driver = Driver.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @driver }
    end
  end
  #Author: Hazem Amin
  #Component: 5
  #Action_Name: new
  #To create a new driver

  def edit
    @driver = Driver.find(params[:id])
  end
  #Author: Hazem Amin
  #Component: 5
  #Action_Name: edit
  #To edit a specific driver

  def create
    @driver = Driver.new(params[:driver])

    respond_to do |format|
      if @driver.save
        format.html { redirect_to @driver, notice: 'Driver was successfully created.' }
        format.json { render json: @driver, status: :created, location: @driver }
      else
        format.html { render action: "new" }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end
  #Author: Hazem Amin
  #Component: 5
  #Action_Name: edit
  #To create a driver


  def update
    @driver = Driver.find(params[:id])

    respond_to do |format|
      if @driver.update_attributes(params[:driver])
        format.html { redirect_to @driver, notice: 'Driver was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end
  #Author: Hazem Amin
  #Component: 5
  #Action_Name: update
  #To update a specific driver

  def destroy
    @driver = Driver.find(params[:id])

    @driver.destroy

    respond_to do |format|
      format.html { redirect_to drivers_url }
      format.json { head :no_content }
    end
  end
  #Author: Hazem Amin
  #Component: 5
  #Action_Name: destroy
  #To delete a specific driver
end