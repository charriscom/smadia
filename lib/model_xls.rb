class ModelXls
  def initialize(resource)
    names=YAML.load_file('config/locales/es.yml')["es"]["activerecord"]["attributes"][resource.name.underscore]
    columns={}
    resource.column_names.each do |name|
      columns[names[name]]=name unless names[name].nil?
    end
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1[0,0] = "ID"
    columns.keys.sort.each_with_index do |key,index|
      sheet1[0,index+1] = key
    end
    resource.all.each_with_index do |r,r_index|
      sheet1[r_index+1,0] = r.id
      columns.keys.sort.each_with_index do |key,index|
        sheet1[r_index+1,index+1] = r.send(columns[key]).to_s
      end
    end
    book.write "#{Rails.root}/tmp/xls/#{resource.name.pluralize}.xls"
  end
end