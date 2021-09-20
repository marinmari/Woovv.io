# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :booking_status
  belongs_to :coworking
  belongs_to :coworker, class_name: "User"

  validates :start_date, presence: {message: "Indiquer une date de départ"}
  validates :end_date, presence: {message: "Indiquer une date de fin"}

  after_create :send_request_confirmation_emails
  after_update :send_booking_response_email


  def send_request_confirmation_emails
    BookingMailer.booking_request_email_manager(self).deliver_now
    BookingMailer.booking_request_email_coworker(self).deliver_now
  end

  def send_booking_response_email
    if self.booking_status_id == 2
      BookingMailer.booking_request_confirmation(self).deliver_now
    elsif self.booking_status_id == 4
      BookingMailer.booking_request_rejection(self).deliver_now
    end

  end

end
