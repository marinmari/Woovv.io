class ContactMailer < ApplicationMailer

  def contact_email(contact)
    @contact = contact
    @email = @contact.email
    @content = @contact.content
    mail(to: 'jojo.justman@gmail.com', subject:"Un Woovver nous sollicite !")
  end


end
