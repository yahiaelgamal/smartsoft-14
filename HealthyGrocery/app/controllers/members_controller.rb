class MembersController < ApplicationController
  before_filter :authenticate_member!
   

  def index
    @members = Member.all
     
  end

  def show

    @member = Member.find(params[:id])
   
    @hash = Gmaps4rails.build_markers(@member) do |user, marker|
      marker.lat user.coordinates[1]
      marker.lng user.coordinates[0]
      marker.infowindow user.address
    end

   end




end
