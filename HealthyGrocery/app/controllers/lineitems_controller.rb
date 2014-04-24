class LineitemsController < ApplicationController
  # GET /lineitems
  # GET /lineitems.json
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

#Authour: Abdelrahman Sakr
#Team : 1
#Method : create
#Paramters : None
#This method adds lineitem to the shopping cart, checks if there is enough amount in the stock of that item,
#and decrements the stock amount for that item if it was successfully added to the shopping cart.
  def create
    @cart2 = current_cart_new
    @item = Item.find(params[:item_id])
    
    if @item.amount > 0
      @lineitem = @cart2.lineitems.build
      @lineitem.item = @item
      @item.amount = @item.amount - 1
      @item.save

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

  # PUT /lineitems/1
  # PUT /lineitems/1.json



#Authour: Abdelrahman Sakr
#Team : 1
#Method : update
#Paramters : None
#This method updates the quantity of the items in the user's shopping cart, and it throws an error if 
#the user ordered a quantity more than the available amount in the stock.
  def update
    @lineitem = Lineitem.find(params[:id])
    @item = Item.find(@lineitem.item_id)
    @quantitytemp = @lineitem.quantity

    respond_to do |format|
      if @lineitem.update_attributes(params[:lineitem])
        if @item.amount - @lineitem.quantity >= 0
             @item.amount = @item.amount - @lineitem.quantity
             @item.save
             format.html { redirect_to 'http://localhost:3000/carts/show'}
             format.json { head :no_content }
        else
             @lineitem.quantity = @quantitytemp
             @lineitem.save
             format.html {redirect_to 'http://localhost:3000/exceededstock.html/' }
        end
      else
        format.html { render action: "edit" }
        format.json { render json: @lineitem.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lineitems/1
  # DELETE /lineitems/1.json
  def destroy
    @lineitem = Lineitem.find(params[:id])
    @lineitem.destroy

    respond_to do |format|
      format.html { redirect_to 'http://localhost:3000/carts/show' }
      format.json { head :no_content }
    end
  end
end
