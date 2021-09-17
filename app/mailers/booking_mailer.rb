class BookingMailer < ApplicationMailer

  def booking_confirmation_email(booking)
    @booking = booking
    @coworking = Coworking.find(@booking.coworking_id)
    @manager = User.find(@coworking.coworking_manager_id)
    mail(to: @manager.email, subject: 'Nouvelle réservation !')
  end


end
