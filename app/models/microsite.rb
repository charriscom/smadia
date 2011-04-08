class Microsite < ActiveRecord::Base
  has_one :image, :as => :owner
  has_one :header, :as => :owner, :class_name => "PaperclipFile", :conditions => "purpose = 'header'"
  has_one :space1, :as => :owner, :class_name => "PaperclipFile", :conditions => "purpose = 'space1'"
  has_one :space2, :as => :owner, :class_name => "PaperclipFile", :conditions => "purpose = 'space2'"
  has_one :space3, :as => :owner, :class_name => "PaperclipFile", :conditions => "purpose = 'space3'"
  has_one :space4, :as => :owner, :class_name => "PaperclipFile", :conditions => "purpose = 'space4'"
  has_one :footer, :as => :owner, :class_name => "PaperclipFile", :conditions => "purpose = 'footer'"
  accepts_nested_attributes_for :image, :header, :space1, :space2, :space3, :space4, :footer
  validates_presence_of :name, :published, :summary, :content 
end
