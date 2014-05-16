# spec/models/member.rb
require 'spec_helper'

describe Member do 
  @disease = FactoryGirl.create(:disease)
  @item = FactoryGirl.create(:item)
  @item2 = FactoryGirl.create(:item)
  @item3 = FactoryGirl.create(:item)
  @restricted_array = []
  @restricted_array << @item.id
  @restricted_array << @item2.id
  @allowed = []
  @allowed << @item2.id
  @allowed << @item2.id
  @allowed << @item3.id

end