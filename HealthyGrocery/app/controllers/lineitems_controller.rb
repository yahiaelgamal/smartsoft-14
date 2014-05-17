class LineitemsController < ApplicationController
 
  #Author: Abdelrahman Sakr
  #Team: 1
  #Method: add_to_cart
  #Parameters: item_id , amount
  #Function: This method adds lineitem to the shopping cart if it is available in stock.
  def add_to_cart
      @current_cart = current_cart_new
      @item = Item.find(params[:itemidnew])
      if @item.amount > 0
          @lineitem = @current_cart.lineitems.build
          @lineitem.item = @item
          @lineitem.quantity = params[:amountnew]
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

  def show
      @lineitem = Lineitem.find(params[:id])
      respond_to do |format|
          format.html # show.html.erb
          format.json { render json: @lineitem }
      end
  end

  def new
      @lineitem = Lineitem.new
      respond_to do |format|
          format.html # new.html.erb
          format.json { render json: @lineitem }
    end
  end

  def edit
      @lineitem = Lineitem.find(params[:id])
  end

  #Author: Abdelrahman Sakr
  #Team: 1
  #Method: update
  #Function: This method updates the quantity of the items in the user's shopping cart,if the item
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

  #Author: Abdelrahman Sakr
  #Team: 1
  #Method: destroy
  #Function: This method deletes an item from the current user's shopping cart.
  def destroy
      @lineitem = Lineitem.find(params[:id])
      @lineitem.destroy
      respond_to do |format|
          format.html { redirect_to 'http://localhost:3000/carts/show' }
          format.json { head :no_content }
      end
  end
end
