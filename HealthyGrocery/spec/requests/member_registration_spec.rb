require "spec_helper"

describe "member registration" do
  it "allows new users to register with an email address and password" do
    visit "/members/sign_up"

    fill_in "email",                 :with => "alindeman@example.com"
    fill_in "password",              :with => "ilovegrapes"
    fill_in "password_confirmation", :with => "ilovegrapes"
    fill_in "first_name",		     :with =>  "chris"				
    fill_in "last_name",		     :with => "miller"
    fill_in "gender",				 :with => "male"
    fill_in	"birth_date",			 :with => "1/9/1990"
    fill_in "phone_num",			 :with => "011111111"
    click_button "Sign up"

    page.should have_content("Welcome! You have signed up successfully.")
  end
end