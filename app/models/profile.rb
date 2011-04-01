class Profile < ActiveRecord::Base
  validates_presence_of :name
  has_one :user
end
