class ShipmentsController < ApplicationController
  # GET /shipments
  # GET /shipments.json
  def index
    @shipments = Shipment.all.page(params[:page]).per(20)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @shipments }
    end
  end

  # GET /shipments/1
  # GET /shipments/1.json
  def show
    @shipment = Shipment.find(params[:id])
    @routes = @shipment.routes.page(params[:page]).per(20)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @shipment }
    end
  end
end
