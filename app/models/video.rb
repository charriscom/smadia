class Video < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_name, :use => :slugged
  def slug_name
    "#{id} #{title}"
  end
  belongs_to :category
  validates_presence_of :title, :published,:link
end
