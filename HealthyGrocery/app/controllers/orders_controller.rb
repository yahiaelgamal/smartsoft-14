class OrdersController < ApplicationController
  # GET /orders
  # GET /orders.json
  # excuting the method by searchong
  #for the order number parameter that is passed from the view
  def index
    @orders = Order.search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @orders }
    end
  end

  def checkout
    member = Member.find(params[:id])
    redirect_to chooseOrder_path( Order.checkout(member))
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find(params[:id])
    @packages=@order.packages
    @items=@order.items
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

  # GET /orders/1/edit
  def edit
    @order = Order.find(params[:id])
  end
  def choose
    @order = Order.find(params[:id])
  end
  # POST /orders
  # POST /orders.json
  # author: Fatma Emran
  #T2
  #Function: Creating an order with the items in the shoppingcart/wishlist and inserting it in the database
  def order_insertion_in_database_items_retrieval
    @l_items = current_member.cart.lineitems
    @items = []
    @count = 0
    #retrieving the items of each order
    @l_items.each do |l|
      @items << l.item
      @items.save
    end
  end

  def create
    @order = Order.new
    current_member.cart.lineitems.each do |l|
      @order.lines.push(l)
    end
    @order.orderNo = current_member.orders.count + 1
    # Author: Mahmoud Walid
    # Team: 3
    # Function: adding the order creared to the list of orders of the signed in member
    respond_to do |format|
      if @order.save
        current_member.orders.push(@order)
        format.html { redirect_to chooseOrder_path(@order), notice: 'Order was successfully created.' }
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
  # Author: Mahmoud Walid
  # Team: 3
  # Function: updates the pass and pass_billing with the ids
  # of the addresses of the shipping and billing addresss
  # to add their coordinates in the order fields coorindates and coordinates_billing
  def submit
    @order = Order.find(params[:id])

    respond_to do |format|
      if @order.update_attributes(params[:order])
        format.html { redirect_to change_path, notice: 'Order was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end
  # Author: Mahmoud Walid
  # Team: 3
  # Function: updating the coordinates and coordinates_billing attributes
  # with the choosed addresses and adding the two addresses to the order
  def change
    @order = Order.find(params[:id])
    @shipping=Address.find(@order.coordinates)
    @order.address.push(@shipping)
    @order.update_attribute(:coordinates,@shipping.coordinates)
    @billing =Address.find(@order.coordinates_billing)
    @order.address.push(@billing)
    @order.update_attribute(:coordinates_billing , @billing.coordinates)
    if(@order.address)
      @order.save
      @order.update_attribute(:isfinished, true)
      redirect_to @order
    else
      redirect_to showOrders_path
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id])
    @order.destroy

    respond_to do |format|
      format.html { redirect_to showOrders_path }
      format.json { head :no_content }
    end
  end
end
