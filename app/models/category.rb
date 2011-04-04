class Category < ActiveRecord::Base
  has_many :subcatergories, :class => "category"
  belongs_to :category
end
  