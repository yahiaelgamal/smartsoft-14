class MembersController < ApplicationController
  before_filter :authenticate_member!
   

  def index
    @members = Member.all
     
  end

  def show
@member = Member.find(params[:id])

  	if current_member.email == 'admin@gmail.com'
  		@admin = true
else 
	@admin = false
    end

    if current_member.cart.nil?
      @exist = false
    else
      @exist = true
    end
   
   end

   def current_cart_one
if session[:cart_id].nil?
      @current_cart = Cart.create!
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end




end
