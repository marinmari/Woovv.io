class RemoveQMarksFromPublicSetUpsColumns < ActiveRecord::Migration[5.2]
  def change
    change_table :public_set_ups, bulk: true do |t|
      t.rename :is_pet_friendly?, :is_pet_friendly

    end
  end
end
