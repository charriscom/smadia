class Image < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true  
  has_attached_file :picture, 
                    :styles => {:small => "201x201>", :medium => "300x300>", :thumb => "100x100>" },
                    :url => "/assets/images/:id/:style/:basename.:extension",
                    :path => ":style/:id-:basename.:extension",
                    :storage => :s3,
                    :s3_credentials => "#{Rails.root}/config/s3.yml",
                    :default_url => "/images/avatar_missing.jpg"
                    
  before_picture_post_process :allow_only_images
   def allow_only_images
     if !(picture.content_type =~ %r{^(image|(x-)?application)/(x-png|pjpeg|jpeg|jpg|png|gif)$})
       return false 
     end
   end
  validates_attachment_size :picture, :less_than => 4.megabytes, :message => " debe pesar maximo 4MB"
  validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png', 'image/jpg', 'application/x-shockwave-flash'], :message => " no es compatible"
  attr_accessible :picture,:purpose
  
end
