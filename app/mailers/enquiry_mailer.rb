class EnquiryMailer < ActionMailer::Base
  default from: CONFIG[:email_username]
  
  def send_message(enquiry)
    @enquiry = enquiry
    mail(to: CONFIG[:admin_email], subject: "New enquiry from #{@enquiry.name}")
  end
end
