class FormEntriesController < ApplicationController
  
  def create
    @form = Form.find(params[:form_id])
    @form_entry = FormEntry.new(params[:form_entry])
    respond_to do |format|
      if @form_entry.save
        Mailer.form_entry_response(@form_entry,@form).deliver
        Mailer.form_entry(@form_entry,@form).deliver
        return redirect_to form_path(@form)
      else 
        debugger
        flash[:error] = "No pudo enviar la informacion, verifique que no existan campos vacios"
        return redirect_to :back
      end
    end
  end
    
end
