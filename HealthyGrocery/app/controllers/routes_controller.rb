class RoutesController < ApplicationController
  # GET /routes
  # GET /routes.json
#lists all routes in the database
  def index
    @routes = Route.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @routes }
    end
  end

  # GET /routes/1
  # GET /routes/1.json
#shows information about a specific route
  def show
    @route = Route.find(params[:id])
    arr = []
    @route.arrOfPoints.each do |points|
      arr1 = [points[1],points[0]]
      arr.push(arr1)
    end  
    gon.arrOfPoints = arr
    gon.retailerLat = Member.find_by(email:"admin@gmail.com").addresses[0].coordinates[1]
    gon.retailerLng = Member.find_by(email:"admin@gmail.com").addresses[0].coordinates[0]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @route }
    end
  end

  # GET /routes/new
  # GET /routes/new.json
#gives a form for entering information about a new truck
  def new
    @route = Route.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @route }
    end
  end

  # GET /routes/1/edit
#gives a form for editing information about an existing truck 
  def edit
    @route = Route.find(params[:id])
  end

  # POST /routes
  # POST /routes.json
#saves a new route to the database
  def create
    @route = Route.new(params[:route])

    respond_to do |format|
      if @route.save
        format.html { redirect_to @route, notice: 'Route was successfully created.' }
        format.json { render json: @route, status: :created, location: @route }
      else
        format.html { render action: "new" }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /routes/1
  # PUT /routes/1.json
#updates infomration about a certain route
  def update
    @route = Route.find(params[:id])

    respond_to do |format|
      if @route.update_attributes(params[:route])
        format.html { redirect_to @route, notice: 'Route was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @route.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /routes/1
  # DELETE /routes/1.json
#deletes a certain route from the database
  def destroy
    @route = Route.find(params[:id])
    @route.destroy

    respond_to do |format|
      format.html { redirect_to routes_url }
      format.json { head :no_content }
    end
  end
end
