class FormEntriesController < ApplicationController
  
  def create
    @form = Form.find(params[:form_id])
    @form_entry = FormEntry.new(params[:form_entry])
    respond_to do |format|
      if @form_entry.save
        Mailer.form_entry(@form_entry,@form).deliver
        redirect_to form_path(@form)
      else
        redirect_to :back
        flash[:error] = "No pudo enviar la informacion"
      end
    end
  end
    
end
