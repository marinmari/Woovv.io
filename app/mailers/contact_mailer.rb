class ContactMailer < ApplicationMailer

  def contact_email(contact)
    @contact = contact
    @email = @contact.email
    @object = @contact.object
    @content = @contact.content
    mail(to: 'hello@woovv.io', subject:"Un Woovver nous sollicite !")
  end


end
