# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)
Admin.delete_all
Category.delete_all
Form.delete_all
Admin.create(:email => "ventas@virtualdiseno.com", :password =>"v1rtu@lD153n0", :password_confirmation => "v1rtu@lD153n0")
Admin.create(:email => "admin@admin.com", :password =>"123456", :password_confirmation => "123456")
main=Category.create(:name =>"Menu Principal", :description => "Menu Principal")
Category.create(:name =>"Articulos", :description => "Articulos", :category_id =>main.id)
Category.create(:name =>"Promociones", :description => "Promociones", :category_id =>main.id)
Category.create(:name =>"Videos", :description => "Videos", :category_id =>main.id)
Category.create(:name =>"Micrositios", :description => "Micrositios", :category_id =>main.id)
Form.create(:name => "Contacto")
Form.create(:name => "Micrositios")
Form.create(:name => "Promociones")