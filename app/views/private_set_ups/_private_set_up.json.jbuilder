# frozen_string_literal: true

json.extract! private_set_up, :id, :created_at, :updated_at
json.url private_set_up_url(private_set_up, format: :json)
