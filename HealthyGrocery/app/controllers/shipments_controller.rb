class ShipmentsController < ApplicationController
  # Author: Karim El-Bawab
  # Team: 4
  # Action name: index
  # Function: this method is used to show all 
  # shipments on the system
  def index
    @shipments = Shipment.all.page(params[:page]).per(20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shipments }
    end
  end

  # Author: Karim El-Bawab
  # Team: 4
  # Action name: show
  # Function: this method is used to show the information
  # of a specific shipment with all its routes
  def show
    @shipment = Shipment.find(params[:id])
    @routes = @shipment.routes.page(params[:page]).per(20)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shipment }
    end
  end
end
