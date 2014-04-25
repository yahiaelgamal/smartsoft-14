class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  # excuting the method by searchong 
  #for the order number parameter that is passed from the view
   handles_sortable_columns
before_filter :require_login ,:except=>[:invalid]
#Author: Omar Sherif
#Team: 4
#Method name: index
#Function: gets the pending orders from the database and orders them by the slected column,and also supports searching 
#for keywords 
  def index
    @orders = Order.where(:status=>'pending').order_by(sortable_column_order).search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end
  

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @order }
    end
  end

  # GET /orders/new
  # GET /orders/new.json
  def new
    @order = Order.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @order }
    end
end
#Author: Omar Sherif
#Team: 4
#Method name: index
#Function: displays a message to users who aren't allowed to view the orders page
  def invalid
@msg = "You don't have access to this page"
end


  

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = Order.new(params[:order])

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render json: @order, status: :created, location: @order }
      else
        format.html { render action: "new" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /orders/1
  # PUT /orders/1.json
  def update
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to orders_url }
      format.json { head :no_content }
    end
  end

private
#Author: Omar Sherif
#Team: 4
#Method name: index
#Function: checks if the logged in user is an admin,if not then the user will be redirected to the invalid page
  def require_login
    unless current_member.email=='admin@gmail.com' 
      redirect_to action: :invalid
    end
  end


end
