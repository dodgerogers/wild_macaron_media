require "spec_helper"

describe UsersController do
  describe "authorized admin access" do
    before(:each) do
      @user = create(:user)
      sign_in @user
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
        assigns(:user).should be_a_new(User)
      end
    end
  
    describe "POST create" do
      describe "with valid params" do
        it "saves user" do
          expect {
            post :create, user: attributes_for(:user)
          }.to change(User, :count).by(1)
        end
      
        it "assigns newly created user as @user" do
          post :create, user: attributes_for(:user)
          assigns(:user).should be_a(User)
          assigns(:user).should be_persisted
        end 
      end
    
      describe "with invalid params" do
        it "assigns a newly created but unsaved user as @user" do
          User.any_instance.stub(:save).and_return(false)
          post :create, user: attributes_for(:user)
          assigns(:user).should be_a_new(User)
        end
      
        it "re renders the new template" do
          User.any_instance.stub(:save).and_return(false)
          post :create, user: attributes_for(:user)
          response.should render_template :new
        end
      end
    end
  
    describe "DELETE destroy" do
      it "destroys the requested question" do
        expect {
          delete :destroy, id: @user
        }.to change(User, :count).by(-1)
      end

      it "redirects to the questions list" do
        delete :destroy, id: @user
        response.should redirect_to users_path
      end
    
      it "delets association: point" do
        post :create, user: attributes_for(:user)
        expect {
          delete :destroy, id: User.last
        }.to change(User, :count).by(-1)
      end
    end
  end
  
  describe "unauthorized access" do
    before(:each) do
      @user1 = create(:user, admin: false)
    end
    
    it "redirects to root from index" do
      get :index
      response.should redirect_to :root
    end
    
    it "redirects to root from new" do
      get :new
      response.should redirect_to :root
    end
    
    it "redirects to root on create" do
      expect {
        post :create, user: attributes_for(:user)
      }.to_not change(User, :count).by(1)
    end
  end
end