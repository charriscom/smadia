class Form < ActiveRecord::Base
  belongs_to :microsite
  belongs_to :promotion
end
