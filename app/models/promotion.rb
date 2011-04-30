class Promotion < ActiveRecord::Base
  has_many :images, :as => "owner"
  belongs_to :category
  validates_presence_of :value, :discount, :discount_value, :title, :terms, :summary, :content
  accepts_nested_attributes_for :images
  #attr_accessible :images_attributes, :images
  include ErrorHandling
  def after_validation 
    format_errors(["images"], ["picture_file_size", "picture_content_type"])
  end
end
