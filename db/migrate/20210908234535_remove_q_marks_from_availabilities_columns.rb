class RemoveQMarksFromAvailabilitiesColumns < ActiveRecord::Migration[5.2]
  def change
    change_table :availabilities, bulk: true do |t|
      t.rename :is_open_monday?, :is_open_monday
      t.rename :is_open_tuesday?, :is_open_tuesday
      t.rename :is_open_wednesday?, :is_open_wednesday
      t.rename :is_open_thursday?, :is_open_thursday
      t.rename :is_open_friday?, :is_open_friday
      t.rename :is_open_saturday?, :is_open_saturday
      t.rename :is_open_sunday?, :is_open_sunday

    end
  end
end
