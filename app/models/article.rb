class Article < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_name, :use => :slugged
  def slug_name
    "#{id} #{title}"
  end
  validates_presence_of :title, :content
  belongs_to :category
  has_one :thumb, :class_name => "Image", :as => :owner, :conditions => "purpose = 'thumb'"
  has_one :carrusel_image, :class_name => "Image", :as => :owner , :conditions => "purpose = 'carrusel'"
  accepts_nested_attributes_for :thumb, :carrusel_image
  #attr_accessible :thumb_attributes, :category_id, :published, :closed, :title, :highlights, :content,
                  #:content_html, :thumb, :carrusel_image, :carrusel_image_attributes
  include ErrorHandling
  def after_validation 
    format_errors(["thumb", "carrusel_image"], ["picture_file_size", "picture_content_type"])
  end
end
