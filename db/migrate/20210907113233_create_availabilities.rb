# frozen_string_literal: true

class CreateAvailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :availabilities do |t|
      t.boolean :is_open_monday?
      t.boolean :is_open_tuesday?
      t.boolean :is_open_wednesday?
      t.boolean :is_open_thursday?
      t.boolean :is_open_friday?
      t.boolean :is_open_saturday?
      t.boolean :is_open_sunday?
      t.datetime :week_opening_time
      t.datetime :week_closing_time
      t.datetime :weekend_opening_time
      t.datetime :weekend_closing_time
      t.integer :available_spots_quantity
      t.integer :price_per_spot_per_day
      t.belongs_to :coworking, foreign_key: true, index: true

      t.timestamps
    end
  end
end
