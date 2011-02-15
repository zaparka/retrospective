class Project < ActiveRecord::Base
  has_many :iterations

  validates_presence_of :name
end
