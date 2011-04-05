class Article < ActiveRecord::Base
  validates_presence_of :title, :content
  belongs_to :category
  has_one :image, :as => :owner, :conditions => "purpose = 'thumb'"
  has_one :carrusel_image, :class_name => "Image", :as => :owner , :conditions => "purpose = 'carrusel'"
  accepts_nested_attributes_for :image, :carrusel_image
  attr_accessible :image_attributes, :category_id, :published, :closed, :title, :highlights, :content,
                  :content_html, :image, :carrusel_image, :carrusel_image_attributes
end
