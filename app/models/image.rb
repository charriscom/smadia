class Image < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true
  has_attached_file :picture, :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_size :picture, :less_than => 4.megabytes, :message => "La imagen debe pesar maximo 4MB"
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png', 'image/jpg'], :message => "El archivo debe ser una imagen"
  attr_accessible :picture,:purpose
end
