class ChangeTimeToString < ActiveRecord::Migration[5.2]
  def change
    change_table :availabilities, bulk: true do |t|
      t.remove :week_opening_time, :week_closing_time, :weekend_opening_time, :weekend_closing_time
      t.string :week_opening_time 
      t.string :week_closing_time
      t.string :weekend_opening_time
      t.string :weekend_closing_time  
    end       
  end
end
