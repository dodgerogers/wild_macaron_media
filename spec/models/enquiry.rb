require "spec_helper"

describe Enquiry do
  before(:each) do
    @enquiry = create(:enquiry)
  end
  
  subject { @enquiry }
  
  it { should respond_to(:name) }
  it { should respond_to(:email) }
  it { should respond_to(:message) }
  it { should respond_to(:created_at) }
  it { should respond_to(:updated_at) }
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:email) }
  it { should validate_presence_of(:message) }
  
  describe "inalid without correct email format" do
    before { @enquiry.email = "@.com" }
    it { should_not be_valid }
  end
end