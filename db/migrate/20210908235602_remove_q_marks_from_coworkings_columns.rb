class RemoveQMarksFromCoworkingsColumns < ActiveRecord::Migration[5.2]
  def change
    change_table :coworkings, bulk: true do |t|
      t.rename :is_operational?, :is_operational
      t.rename :is_from_scrapping?, :is_from_scrapping

    end
  end
end
