# spec/models/disease.rb
require 'spec_helper'

describe Disease do
  it "has a valid factory"
    Factory.create(:disease).should be_valid 
  end
  it "is invalid without a name" do
    Factory.build(:disease, name: nil).should_not be_valid
  end	

end





	