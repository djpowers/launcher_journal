class Author < ActiveRecord::Base
  validates_presence_of :name
  validates_email_format_of :email

  has_many :entries

  def self.authors_info
    output = []
    self.all.each do |author|
      output << [author.name, author.id]
    end
    output
  end

end
