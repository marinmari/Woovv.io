class AddAttributesCoworkings < ActiveRecord::Migration[5.2]
  def change
    change_table :users, bulk: true do |t|
      t.integer :longitude
      t.integer :latitude
    end
  end
end
