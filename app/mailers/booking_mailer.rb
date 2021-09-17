class BookingMailer < ApplicationMailer

  def booking_confirmation_email_manager(booking)
    @booking = booking
    @coworking = Coworking.find(@booking.coworking_id)
    @manager = User.find(@coworking.coworking_manager_id)
    mail(to: @manager.email, subject: 'Nouvelle réservation à valider !')
  end

   def booking_confirmation_email_coworker(booking)
    @booking = booking
    @coworking = Coworking.find(@booking.coworking_id)
    @coworker = User.find(@coworking.coworker_id)
    mail(to: @coworker.email, subject: 'Confirmation de votre demande de réservation !')
  end


end
