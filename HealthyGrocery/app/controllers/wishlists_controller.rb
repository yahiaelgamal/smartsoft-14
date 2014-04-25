class WishlistsController < ApplicationController

  #Author: Mohamed Saeed
  #team : 1
  #Paramters: none
  # GET /wishlists
  # GET /wishlists.json
  def index
    @wishlists = Wishlist.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @wishlists }
    end
  end

  #Author: Mohamed Saeed
  #Team : 1
  #Paramters: none
  # GET /wishlists/1
  # GET /wishlists/1.json
  def show
    #@wishlist = Wishlist.find(params[:id])
    @wishlist = current_member.wishlist

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @wishlist }
    end
  end

  #Author: Mohamed Saeed
  #Team : 1
  #Paramters: none
  # GET /wishlists/new
  # GET /wishlists/new.json
  def new
    @wishlist = Wishlist.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @wishlist }
    end
  end

  #Author: Mohamed Saeed
  #Team : 1
  #Paramters: none
  # GET /wishlists/1/edit
  def edit
    @wishlist = Wishlist.find(params[:id])
  end

  #Author: Mohamed Saeed
  #Team : 1
  #Paramters: none
  # POST /wishlists
  # POST /wishlists.json
  def create
    @wishlist = Wishlist.new(params[:wishlist])

    respond_to do |format|
      if @wishlist.save
        format.html { redirect_to @wishlist, notice: 'Wishlist was successfully created.' }
        format.json { render json: @wishlist, status: :created, location: @wishlist }
      else
        format.html { render action: "new" }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end
  #Author: Mohamed Saeed
  #Team : 1
  #Paramters: none
  # PUT /wishlists/1
  # PUT /wishlists/1.json
  def update
    @wishlist = Wishlist.find(params[:id])

    respond_to do |format|
      if @wishlist.update_attributes(params[:wishlist])
        format.html { redirect_to @wishlist, notice: 'Wishlist was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @wishlist.errors, status: :unprocessable_entity }
      end
    end
  end

  #Author: Mohamed Saeed
  #Team : 1
  #Paramters: none
  # DELETE /wishlists/1
  # DELETE /wishlists/1.json
  def destroy
    @wishlist = Wishlist.find(params[:id])
    @wishlist.destroy

    respond_to do |format|
      format.html { redirect_to wishlists_url }
      format.json { head :no_content }
    end
  end
end
