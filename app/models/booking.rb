# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :booking_status
  belongs_to :coworking
  belongs_to :coworker, class_name: "User"

  after_create :send_confirmation_email

  

  def send_confirmation_email
    BookingMailer.booking_confirmation_email_manager(self).deliver_now
  end

end
