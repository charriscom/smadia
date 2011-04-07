class Video < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :title, :published
  validates_format_of  :link, :with =>
          /(^$)|(^(http|https):\/\/[a-z0-9]+([\-\.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?$)/ix
end
