class MembersController < ApplicationController
  before_filter :authenticate_member!
   

  def index
    @members = Member.all
     
  end

  def show

    @member = Member.find(params[:id])
   

   end




end
