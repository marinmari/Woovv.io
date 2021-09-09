class AddUniquenessToAvailabilities < ActiveRecord::Migration[5.2]
  def change
    change_table :availabilities, bulk: true do |t|
      t.remove :coworking_id
      t.belongs_to :coworking, foreign_key: true, index: { unique: true }
    end
  end
end
