class RemoveLongLatColumnFromUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users, bulk: true do |t|
      t.remove :longitude, :latitude
    end
  end
end
