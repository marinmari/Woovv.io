# frozen_string_literal: true

class Coworking < ApplicationRecord
  has_one :availability, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :coworkers, class_name: "User", through: :bookings
  belongs_to :coworking_manager, class_name: "User", optional: true
  belongs_to :managing_company, class_name: "Company"
  has_one :public_set_up, dependent: :destroy
  has_one :private_set_up, dependent: :destroy
end
