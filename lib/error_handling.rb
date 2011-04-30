module ErrorHandling
  
  def format_errors(attrs, fields)
    attrs.each do |att|
      fields.each do |field|
        error=errors[(att+"."+field).to_sym][0]
        errors.delete((att+"."+field).to_sym) unless error.nil?
=begin
        if self.send(att.to_sym).class == Array
          debugger
          names = []
          self.send(att.to_sym).each do |a|
            names << a.picture_file_name unless a.errors.empty?
          end
          
        else
          errors[att] = error unless error.nil?
        end
=end
        errors[att] = error unless error.nil?
      end
    end
  end
  
end