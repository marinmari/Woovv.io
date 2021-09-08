# frozen_string_literal: true

class CreatePublicSetUps < ActiveRecord::Migration[5.2]
  def change
    create_table :public_set_ups do |t|
      t.belongs_to :coworking, foreign_key: true, index: true
      t.belongs_to :coffee_access, foreign_key: { to_table: :public_set_up_accesses }
      t.belongs_to :bike_storage, foreign_key: { to_table: :public_set_up_accesses }
      t.boolean :is_pet_friendly?
      t.integer :network_speed

      t.timestamps
    end
  end
end
