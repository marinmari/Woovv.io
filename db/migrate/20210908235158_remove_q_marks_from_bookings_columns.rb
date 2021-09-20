# frozen_string_literal: true

class RemoveQMarksFromBookingsColumns < ActiveRecord::Migration[5.2]
  def change
    change_table :bookings, bulk: true do |t|
      t.rename :coworking_rules_approved?, :coworking_rules_approved
    end
  end
end
