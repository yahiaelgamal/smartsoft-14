require "spec_helper"

describe "member sign in" do
  it "allows members to sign in after they have registered" do
    user = Member.create(:email    => "alindeman@example.com",
                       :password => "ilovegrapes")

    visit "/members/sign_in"

    fill_in "Email",    :with => "alindeman@example.com"
    fill_in "Password", :with => "ilovegrapes"

    click_button "Sign in"

    page.should have_content("Signed in successfully.")
  end
end