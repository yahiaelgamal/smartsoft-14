class LineitemsController < ApplicationController
  # GET /lineitems
  # GET /lineitems.json

  #Author: Abdelrahman Sakr
  #Team: 1
  #Method: add_to_cart
  #Parameters: item_id , amount
  #This method adds lineitem to the shopping cart if it is available in stock.
  def add_to_cart
    @current_cart = current_cart_new
    @item = Item.find(params[:item_id])

    if @item.amount > 0
       @lineitem = @current_cart.lineitems.build
       @lineitem.item = @item
       @lineitem.quantity = params[:amount]
       respond_to do |format|
        if @lineitem.save
          format.html { redirect_to @lineitem.cart}
          format.json { render json: @lineitem, status: :created, location: @lineitem }
        else
          format.html { render action: "new" }
          format.json { render json: @lineitem.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to 'http://localhost:3000/itemnotfound.html/'
    end
  end

  def index
    @lineitems = Lineitem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @lineitems }
    end
  end

  # GET /lineitems/1
  # GET /lineitems/1.json
  def show
    @lineitem = Lineitem.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @lineitem }
    end
  end

  # GET /lineitems/new
  # GET /lineitems/new.json
  def new
    @lineitem = Lineitem.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @lineitem }
    end
  end

  # GET /lineitems/1/edit
  def edit
    @lineitem = Lineitem.find(params[:id])
  end

  # POST /lineitems
  # POST /lineitems.json

  #Author: Abdelrahman Sakr
  #Team: 1
  #Method: update
  #This method updates the quantity of the items in the user's shopping cart,if the item
  #is available in stock.
  def update
    @lineitem = Lineitem.find(params[:id])
    @item = Item.find(@lineitem.item_id)
    @lineitem_quantity_temp = @lineitem.quantity

    respond_to do |format|
      if @lineitem.update_attributes(params[:lineitem])
        if @item.amount > 0
             format.html { redirect_to 'http://localhost:3000/carts/show'}
             format.json { head :no_content }
        else
             @lineitem.quantity = @lineitem_quantity_temp
             @lineitem.save
             format.html {redirect_to 'http://localhost:3000/itemnotfound.html/' }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @lineitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lineitems/1
  # DELETE /lineitems/1.json

  #Author: Abdelrahman Sakr
  #Team: 1
  #Method: destroy
  #This method deletes an item from the current user's shopping cart.
  def destroy
    @lineitem = Lineitem.find(params[:id])
    @lineitem.destroy

    respond_to do |format|
      format.html { redirect_to 'http://localhost:3000/carts/show' }
      format.json { head :no_content }
    end
  end
end
