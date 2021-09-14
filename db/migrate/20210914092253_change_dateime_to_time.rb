class ChangeDateimeToTime < ActiveRecord::Migration[5.2]
  def change
    change_table :availabilities, bulk: true do |t|
      t.remove :week_opening_time, :week_closing_time, :weekend_opening_time, :weekend_closing_time
      t.time :week_opening_time 
      t.time :week_closing_time
      t.time :weekend_opening_time
      t.time :weekend_closing_time  
    end   
    change_column_default :availabilities, :is_open_saturday, from: true, to: false
    change_column_default :availabilities, :is_open_sunday, from: true, to: false
  end
end
