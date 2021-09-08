# frozen_string_literal: true

json.extract! availability, :id, :created_at, :updated_at
json.url availability_url(availability, format: :json)
