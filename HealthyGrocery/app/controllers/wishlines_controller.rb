class WishlinesController < ApplicationController

  #Author: Mohamed Saeed
  #Team : 1
  #Paramters: none
  # GET /wishlines
  # GET /wishlines.json
  def index
    @wishlines = Wishline.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wishlines }
    end
  end

  #Author: Mohamed Saeed
  #Team : 1
  #Paramters: none
  # GET /wishlines/1
  # GET /wishlines/1.json
  def show
    @wishline = Wishline.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wishline }
    end
  end

  #Author: Mohamed Saeed
  #Team : 1
  #Paramters: none
  # GET /wishlines/new
  # GET /wishlines/new.json
  def new
    @wishline = Wishline.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wishline }
    end
  end

  #Author: Mohamed Saeed
  #Team : 1
  #Paramters: none
  # GET /wishlines/1/edit
  def edit
    @wishline = Wishline.find(params[:id])
  end

  #Author: Mohamed Saeed
  #Team : 1
  #Paramters: none
  # POST /wishlines
  # POST /wishlines.json
  def create
    #@wishline = Wishline.new(params[:wishline])
    @wish = current_wish_new
    @item = Item.find(params[:item_id])
    @existalready = false
     @wish.wishline.each do |i|
        if i.item_id == @item.id 
          @existalready = true
        end
      end
        if @existalready == false
    @wishline = @wish.wishline.build
    @wishline.item = @item


    respond_to do |format|
      if @wishline.save
        format.html { redirect_to @wishline.wishlist}
        format.json { render json: @wishline, status: :created, location: @wishline }
      else
        format.html { render action: "new" }
        format.json { render json: @wishline.errors, status: :unprocessable_entity }
      end
    end
  else
    redirect_to 'http://localhost:3000/404.html'
  end
  end

  #Author: Mohamed Saeed
  #Team : 1
  #Paramters: none
  # PUT /wishlines/1
  # PUT /wishlines/1.json
  def update
    @wishline = Wishline.find(params[:id])

    respond_to do |format|
      if @wishline.update_attributes(params[:wishline])
        format.html { redirect_to @wishline, notice: 'Wishline was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wishline.errors, status: :unprocessable_entity }
      end
    end
  end

  #Author: Mohamed Saeed
  #Team : 1
  #Paramters: none  
  # DELETE /wishlines/1
  # DELETE /wishlines/1.json
  def destroy
    @wishline = Wishline.find(params[:id])
    @wishline.destroy

    respond_to do |format|
      format.html { redirect_to 'http://localhost:3000/wishlists/show'}
      format.json { head :no_content }
    end
  end
end
