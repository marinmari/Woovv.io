# frozen_string_literal: true

json.extract! public_set_up, :id, :created_at, :updated_at
json.url public_set_up_url(public_set_up, format: :json)
