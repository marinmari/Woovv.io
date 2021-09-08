# frozen_string_literal: true

class CreatePublicSetUpAccesses < ActiveRecord::Migration[5.2]
  def change
    create_table :public_set_up_accesses do |t|
      t.string :set_up_access

      t.timestamps
    end
  end
end
