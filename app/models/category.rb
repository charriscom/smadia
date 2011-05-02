class Category < ActiveRecord::Base
  has_many :subcategories, :class_name => "Category"
  has_many :articles
  has_many :promotions
  has_many :videos
  has_many :microsites
  belongs_to :parent_category, :class_name => "Category", :foreign_key => "category_id"
  
  validates_presence_of :name, :description
end
  