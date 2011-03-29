class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
  
  validates_presence_of :identifier, :name, :last_name, :login
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :identifier, :name, :middle_name, :last_name,
   :second_last_name, :login, :birth_date, :profesion, :position, :business_name, :business_phone, :business_phone_ext,
    :business_phone_type, :phone, :phone_type, :mobile, :address, :address_type, :country, :state, :city, :email_type
end
