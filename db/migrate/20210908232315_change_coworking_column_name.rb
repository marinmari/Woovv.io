class ChangeCoworkingColumnName < ActiveRecord::Migration[5.2]
  def change
    change_table :coworkings, bulk: true do |t|
      t.rename :manager_id, :coworking_manager_id
    end
  end
end
