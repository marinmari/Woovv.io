# frozen_string_literal: true

class AddLongLatColumnToCoworkings < ActiveRecord::Migration[5.2]
  def change
    change_table :coworkings, bulk: true do |t|
      t.integer :longitude
      t.integer :latitude
    end
  end
end
