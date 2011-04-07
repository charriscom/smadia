class PaperclipFile < ActiveRecord::Base
  belongs_to :owner, :polymorphic => true
  has_attached_file :file
end
