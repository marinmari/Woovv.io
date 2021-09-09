# frozen_string_literal: true

class BookingStatus < ApplicationRecord
  has_many :bookings, foreign_key: "booking_status_id", dependent: :destroy
end
