# frozen_string_literal: true

class AddDefaultValuesToAvailabilities < ActiveRecord::Migration[5.2]
  def up
    change_table :availabilities, bulk: true do |t|
      t.remove :is_open_monday?, :is_open_tuesday?, :is_open_wednesday?, :is_open_thursday?, :is_open_friday?, :is_open_saturday?, :is_open_sunday?
      t.boolean :is_open_monday?, default: true
      t.boolean :is_open_tuesday?, default: true
      t.boolean :is_open_wednesday?, default: true
      t.boolean :is_open_thursday?, default: true
      t.boolean :is_open_friday?, default: true
      t.boolean :is_open_saturday?, default: true
      t.boolean :is_open_sunday?, default: true
    end
  end

  def down
    change_table :availabilities, bulk: true do |t|
      t.remove :is_open_monday?, :is_open_tuesday?, :is_open_wednesday?, :is_open_thursday?, :is_open_friday?, :is_open_saturday?, :is_open_sunday?
      t.boolean :is_open_monday?
      t.boolean :is_open_tuesday?
      t.boolean :is_open_wednesday?
      t.boolean :is_open_thursday?
      t.boolean :is_open_friday?
      t.boolean :is_open_saturday?
      t.boolean :is_open_sunday?
    end
  end
end
