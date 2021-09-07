class CreatePrivateSetUps < ActiveRecord::Migration[5.2]
  def change
    create_table :private_set_ups do |t|
      t.belongs_to :coworking, foreign_key: true, index: true
      t.string :wifi_password
      t.string :manager_phone_number

      t.timestamps
    end
  end
end
