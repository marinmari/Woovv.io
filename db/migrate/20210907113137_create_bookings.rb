class CreateBookings < ActiveRecord::Migration[5.2]
  def change
    create_table :bookings do |t|
      t.datetime :start_date
      t.datetime :end_date
      t.boolean :coworking_rules_approved?
      t.belongs_to :booking_status, foreign_key: true, index: true
      t.belongs_to :coworking, foreign_key: true, index: true
      t.belongs_to :coworker, foreign_key: {to_table: :users}, index: true

      t.timestamps
    end
  end
end
