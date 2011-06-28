class Mailer < ActionMailer::Base
  default :from => "no-reply@smadiaclinic.com"
  
  def form_entry_response(form_entry, form)
    @form_entry = form_entry
    @form=form
    mail(:to => @form_entry.email, :subject => "SmadiaClinic")
  end
  def form_entry(form_entry, form)
    @form_entry = form_entry
    @form=form
    mail(:to => "info@smadiaclinic.com", :subject => "SmadiaClinic")
  end
  
end
