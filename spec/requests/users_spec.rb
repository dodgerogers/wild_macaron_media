require "spec_helper"

describe "User management" do
  before(:each) do
    @user = create(:user)
  end
  
  it "should successfully sign in existing user" do
    visit root_path
    within('footer') do
       click_link "Login"
    end
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: @user.password
    click_button "Sign in"
    page.should have_content "Signed in successfully"
    page.should have_content "Dashboard"
  end
  
  it "should successfully logout an existing user" do
    visit root_path
    within('footer') do
       click_link "Login"
    end
    fill_in "user_email", with: @user.email
    fill_in "user_password", with: @user.password
    click_button "Sign in"
    click_link "Logout"
    page.should have_content "We write totally awesome editorial"
  end
end