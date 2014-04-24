class MembersController < ApplicationController
  before_filter :authenticate_member!
   

  def index
    @members = Member.all
     
  end

  def show

    @member = Member.find(params[:id])
   

   end

   def recommended_items 
    @member = Member.find(params[:id])
    if !@member.diseases.empty?
      @recommended_items = Array.new

      @member.diseases.each do |disease|
        if !@disease.recommended_items.empty?
          @disease.recommended_items.each do |item|
            unless  @recommended_items.include? (item)
              @recommended_items.push(item)
            end
          end
        end
      end
    
      @member.diseases.each do |disease|
        if !@disease.restricted_items.empty?
          @recommended_items.each do |item|
            if @disease.restricted_items.include? (item)
              @recommended_items.delete(item)
            end
          end
        end
      end
      @member.recommended_items = recommended_items
      @member.save
    end
  end

  #Author : Magd Elshebokshy
  #Component : 3
  #Method name : recommended_items
  #Function : Make a list of recommended items to the member, using the 
  #recommended items and restricted items for his diseases.
  #Parameters : diseases - diseases' recommended items - diseases' restricted items.


end
