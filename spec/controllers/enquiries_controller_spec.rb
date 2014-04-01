require "spec_helper"

describe EnquiriesController do
  include Devise::TestHelpers 
  before(:each) do
    @user = create(:user)
    sign_in @user
    @enquiry = create(:enquiry)
  end
  
  describe "GET show" do
    it "renders indeshowx template" do
      get :show, id: @enquiry
      assigns(:enquiry).should eq(@enquiry)
    end
    
    it "renders the show template" do
      get :show, id: @enquiry
      response.should render_template :show
    end
  end
    
  describe "GET index" do
    it "renders index template" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET new" do
    it "renders new template" do
      get :new
      response.should render_template :new
    end
  end
  
  describe "POST create" do
    describe "with valid params" do
      it "saves enquiry" do
        expect {
          post :create, enquiry: attributes_for(:enquiry)
        }.to change(Enquiry, :count).by(1)
      end
    
      it "assigns newly created user as @user" do
        post :create, enquiry: attributes_for(:enquiry)
        assigns(:enquiry).should be_a(Enquiry)
        assigns(:enquiry).should be_persisted
      end 
    end
  
    describe "with invalid params" do
      it "assigns a newly created but unsaved user as @user" do
        Enquiry.any_instance.stub(:save).and_return(false)
        post :create, enquiry: attributes_for(:enquiry)
        assigns(:enquiry).should be_a_new(Enquiry)
      end
    
      it "re renders the new template" do
        Enquiry.any_instance.stub(:save).and_return(false)
        post :create, enquiry: attributes_for(:enquiry)
        response.should redirect_to :root
      end
    end
  end
  
  describe "DELETE destroy" do
    it "destroys the requested question" do
      expect {
        delete :destroy, id: @enquiry
      }.to change(Enquiry, :count).by(-1)
    end

    it "redirects to the questions list" do
      delete :destroy, id: @enquiry
      response.should redirect_to enquiries_path
    end
  
    it "delets association: point" do
      post :create, enquiry: attributes_for(:enquiry)
      expect {
        delete :destroy, id: Enquiry.last
      }.to change(Enquiry, :count).by(-1)
    end
  end

  
  describe "send_message email" do
    before(:each) do
      EnquiryMailer.any_instance.unstub(:send_message)
      ActionMailer::Base.deliveries = []
      ActionMailer::Base.perform_deliveries = true
    end
    
    after(:each) do
      ActionMailer::Base.deliveries.clear
    end
    
    it "successfully sends after create" do
      post :create, enquiry: attributes_for(:enquiry)
      ActionMailer::Base.deliveries.count.should eq 1
    end
  end
end