class FormEntry < ActiveRecord::Base
  validates_confirmation_of :email
  validates_presence_of :name, :phone
end
