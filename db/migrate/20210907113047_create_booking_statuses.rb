# frozen_string_literal: true

class CreateBookingStatuses < ActiveRecord::Migration[5.2]
  def change
    create_table :booking_statuses do |t|
      t.string :status

      t.timestamps
    end
  end
end
