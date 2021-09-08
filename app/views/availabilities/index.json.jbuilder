# frozen_string_literal: true

json.array! @availabilities, partial: "availabilities/availability", as: :availability
