require 'spec_helper'

#Author: Sameh Metias
#Team: 3
#Function: This test is for compairing the url generated for printing

describe "Creating a new printing url for a route" do
  it "should be as expected" do
    @r = Route.new :arrOfPoints => [[31.111,32.222],[32.111,32.222]]
    url = @r.get_print_url()
    expect(url).to eq 'http://maps.google.com/maps?
    f=d&source=s_d&saddr=30.199,31.002&daddr=31.111,32.222+to:32.111,32.222
    +to:30.199,31.002&ie=UTF8&z=10&pw=2&hl=en'
  end 
end
