class EnquiriesController < ApplicationController
  load_and_authorize_resource only: [:index, :show]
  
  def show
    @enquiry = Enquiry.find(params[:id])
  end
  
  def index
    @enquiries = Enquiry.order("created_at desc")
  end
  
  def create
    @enquiry = Enquiry.create(enquiry_params)
    respond_to do |format|
      if @enquiry.save
        EnquiryMailer.delay.send_message(@enquiry)
        format.html { redirect_to root_path, notice: "Your message was sent! We will respond shortly" }
        format.js
      else
        format.html { redirect_to root_path, notice: "Your message was not sent, please try again" }
        format.js
      end
    end
  end
  
  def destroy
    @enquiry = Enquiry.find(params[:id]).destroy
    respond_to do |format|
      format.html { redirect_to enquiries_path, notice: "Enquiry Deleted" }
      format.js
    end
  end
  
  private
  
  def enquiry_params
    params.require(:enquiry).permit(:name, :email, :message)
  end
end