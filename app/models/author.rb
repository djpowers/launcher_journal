class Author < ActiveRecord::Base
  validates_presence_of :name
  validates_email_format_of :email

end