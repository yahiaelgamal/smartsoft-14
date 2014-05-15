# spec/models/disease.rb
require 'spec_helper'

describe Disease do
  it "has a valid factory"
    Factory.create(:disease).should be_valid 
  end
  it "is invalid without a name"
  it "is invalid without a unique name"
end





	