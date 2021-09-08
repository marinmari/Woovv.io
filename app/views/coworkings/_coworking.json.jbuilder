# frozen_string_literal: true

json.extract! coworking, :id, :created_at, :updated_at
json.url coworking_url(coworking, format: :json)
