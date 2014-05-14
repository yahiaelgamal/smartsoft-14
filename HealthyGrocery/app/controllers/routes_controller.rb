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
end  
