class BookingStatus < ApplicationRecord
  has_many :bookings, foreign_key: 'booking_status_id'

end
