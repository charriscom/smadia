class UsersXls
  book = Spreadsheet::Workbook.new
  sheet1 = book.create_worksheet
  sheet1[0,0] = "ID"  
  sheet1[0,1] = "Email"
  sheet1[0,2] = "Nombre"
  sheet1[0,3] = "Cargo"
  sheet1[0,4] = "Empresa"
  sheet1[0,5] = "Telefono"
  sheet1[0,6] = "Alias"
  @users=User.all
  @users.each_with_index do |user,index|
    sheet1[index+1,0] = user.identifier
    sheet1[index+1,1] = user.email
    sheet1[index+1,2] = user.name
    sheet1[index+1,3] = user.position
    sheet1[index+1,4] = user.business_name
    sheet1[index+1,5] = user.phone
    sheet1[index+1,6] = user.login
  end
  book.write "#{Rails.root}/tmp/xls/users.xls"
end