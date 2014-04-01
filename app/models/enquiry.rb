class Enquiry < ActiveRecord::Base
  validates :name, presence: true
  validates :message, presence: true
  validates_format_of :email, with: Devise.email_regexp
end