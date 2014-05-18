class RoutesController < ApplicationController
  # Author: Karim El-Bawab
  # Team: 4
  # Action name: index
  # Function: this method is used to show all routes 
  # with some details about each route 
  def index
    @routes = Route.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @routes }
    end
  end

#shows information about a specific route
#Author: Sameh Metias
#Team: 3
#Function: Added the links to the print routes and the print instructions pages 

  # Author: Karim El-Bawab
  # Team: 4
  # Action name: show
  # Function: this method is used to show specific route 
  # and it passes to the view the warehouse location (lat, lng)
  # and the array of points of the orders locations 
  def show
    @route = Route.find(params[:id])
    gon.arrOfPoints = Route.show(params[:id])
    gon.retailerLat = Member.find_by(email:"admin@gmail.com").addresses[0].coordinates[1]
    gon.retailerLng = Member.find_by(email:"admin@gmail.com").addresses[0].coordinates[0]

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @route }
      format.pdf do
        pdf=RoutePdf.new(@route)
        pdf.print
        send_data pdf.render, filename: "route_#{@route.id}.pdf", type: "application/pdf", 
                              disposition: "inline"
      end  
    end
  end
end  
