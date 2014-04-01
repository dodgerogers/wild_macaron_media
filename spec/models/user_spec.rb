require 'spec_helper'

describe User do
  before(:each) do
    @user = create(:user)
  end
  
  subject { @user }
  
  it { should respond_to(:email) }
  it { should respond_to(:password) }
  it { should respond_to(:encrypted_password) }
  it { should respond_to(:admin) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should respond_to(:reset_password_token) }
  it { should respond_to(:reset_password_sent_at) }
  it { should respond_to(:remember_created_at) }
  it { should respond_to(:sign_in_count) }
  it { should respond_to(:current_sign_in_at) }
  it { should respond_to(:last_sign_in_at) }
  it { should respond_to(:current_sign_in_ip) }
  it { should respond_to(:last_sign_in_ip) }
  
  describe "validates email" do
    before { @user.email = "not-valid-email.com" }
    it { should_not be_valid }
  end
  
  describe "password too short" do
    before { @user.email = "passwor" }
    it { should_not be_valid }
  end
end
