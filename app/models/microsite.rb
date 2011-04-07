class Microsite < ActiveRecord::Base
  has_one :image, :as => :owner
  has_one :header, :as => :owner, :class_name => "PaperclipFile", :conditions => "purpose = 'header'"
  accepts_nested_attributes_for :image, :header
end
