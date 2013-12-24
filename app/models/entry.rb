class Entry < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :description
  validates_presence_of :author

  belongs_to :author
  belongs_to :category

end
