class ContactMailer < ActionMailer::Base
  default :from => "from@example.com", :charset => "iso-2022-jp"

  def cont_mail(contact)
    @contact = contact
    mail :to => contact.email,
         :subject => contact.subject
    
  end
end
