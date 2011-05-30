class Mailer < ActionMailer::Base
  default :from => "no-reply@smadiaclinic.com"
  
  def form_entry(form_entry, form)
    @form_entry = form_entry
    @form=form
    mail(:to => @form_entry.email, :subject => "SmadiaClinic")
  end
end
