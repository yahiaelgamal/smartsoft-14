class MembersController < ApplicationController
  before_filter :authenticate_member!
   

  def index
    @members = Member.all
     
  end

  def myprofile
    @member = Member.find(params[:member_id])
   end


   def show
     @member = Member.find(params[:id])
   end



end
