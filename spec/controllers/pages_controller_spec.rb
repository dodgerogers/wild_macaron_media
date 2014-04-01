require "spec_helper"

describe PagesController do
  include Devise::TestHelpers 
  before(:each) do
    @user = create(:user)
    sign_in @user
  end
  
  describe "GET home" do
    it "renders home template" do
      get :home
      response.should render_template :home
    end
  end
  
  describe "GET admindashboard" do
    it "renders dashboard when admin" do
      get :dashboard
      response.should render_template :dashboard
    end
  end
end