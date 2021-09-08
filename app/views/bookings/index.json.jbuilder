# frozen_string_literal: true

json.array! @bookings, partial: "bookings/booking", as: :booking
