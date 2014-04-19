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
   
   end




end
