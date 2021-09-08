# frozen_string_literal: true

class Coworking < ApplicationRecord
  has_one :availability, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :coworkers, class_name: "User", through: :bookings
  belongs_to :manager, class_name: "User"
  has_one :public_set_up
  has_one :private_set_up
end
