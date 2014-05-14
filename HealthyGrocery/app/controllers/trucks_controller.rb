class TrucksController < ApplicationController
  #handling sort table
  handles_sortable_columns
  # GET /trucks
  # GET /trucks.json
  def index
    #handling table sort by
    order = sortable_column_order
    @trucks = Truck.all.order_by(order)
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @trucks }
    end
  end

  # GET /trucks/1
  # GET /trucks/1.json
  def show
    @truck = Truck.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @truck }
    end
  end

  # GET /trucks/new
  # GET /trucks/new.json
  def new
    @truck = Truck.new
    @truckless_drivers = Driver.where(truck: nil)
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @truck }
    end
  end

  # GET /trucks/1/edit
  def edit
    @truck = Truck.find(params[:id])
    
  end

  def verify
        @truck = Truck.find(params[:id])
  end

  # POST /trucks
  # POST /trucks.json
  def create
    @truck = Truck.new(params[:truck])

    respond_to do |format|
      if @truck.save
        format.html { redirect_to @truck, notice: 'Truck was successfully created.' }
        format.json { render json: @truck, status: :created, location: @truck }
      else
        format.html { render action: "new" }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /trucks/1
  # PUT /trucks/1.json
  def update
    @truck = Truck.find(params[:id])

    respond_to do |format|
      if @truck.update_attributes(params[:truck])
    # Author: Andrew Khouzam
    # Component: 1
    # Functions: This route is used to redirect to the verify page that verify the arrived orders.
    # If the status is false it redirects to check the orders and if not it just shows the updated truck
    if @truck.status == false
        format.html { redirect_to verifyOrder_path(@truck), notice: 'Please Verify the Orders' }
        format.json { head :no_content }
      else
         format.html { redirect_to @truck, notice: 'Your Truck Has Been Updated' }
        format.json { head :no_content }
      end

      else
        format.html { render action: "edit" }
        format.json { render json: @truck.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /trucks/1
  # DELETE /trucks/1.json
  def destroy
    @truck = Truck.find(params[:id])
    @truck.destroy

    respond_to do |format|
      format.html { redirect_to trucks_url }
      format.json { head :no_content }
    end
  end
end
