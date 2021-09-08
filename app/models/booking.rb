# frozen_string_literal: true

class Booking < ApplicationRecord
  belongs_to :booking_status
  belongs_to :coworking
  belongs_to :coworker, class_name: "User"
  # validates :start_date, presence: true 
  # validates :end_date, presence: true 
  validates :coworking_rules_approved, presence: true, acceptance: true
end
