class Promotion < ActiveRecord::Base
  has_many :images, :as => "owner"
  belongs_to :category
  validates_presence_of :value, :discount, :discount_value, :title, :terms, :summary, :content
  accepts_nested_attributes_for :images
  attr_accessible :images_attributes, :images
end
