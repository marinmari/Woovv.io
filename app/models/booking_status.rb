# frozen_string_literal: true

class BookingStatus < ApplicationRecord
  has_many :bookings, dependent: :destroy
end
