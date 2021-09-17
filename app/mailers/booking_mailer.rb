class BookingMailer < ApplicationMailer

  def booking_request_email_manager(booking)
    @booking = booking
    @coworking = Coworking.find(@booking.coworking_id)
    @coworker = User.find(@booking.coworker_id)
    @manager = User.find(@coworking.coworking_manager_id)
    mail(to: @manager.email, subject: 'Nouvelle réservation à valider')
  end

   def booking_request_email_coworker(booking)
    @booking = booking
    @coworking = Coworking.find(@booking.coworking_id)
    @coworker = User.find(@booking.coworker_id)
    mail(to: @coworker.email, subject: 'Confirmation de votre demande de réservation !')
  end

  def booking_request_confirmation(booking)
    @booking = booking
    @coworking = Coworking.find(@booking.coworking_id)
    @coworker = User.find(@booking.coworker_id)
    mail(to: @coworker.email, subject: 'Votre réservation est validée !')
  end

  def booking_request_rejection(booking)
    @booking = booking
    @coworking = Coworking.find(@booking.coworking_id)
    @coworker = User.find(@booking.coworker_id)
    mail(to: @coworker.email, subject: "Oh non... pas de coworking pour cette fois-ci")
  end

end
