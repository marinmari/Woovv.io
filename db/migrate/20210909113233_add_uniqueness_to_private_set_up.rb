# frozen_string_literal: true

class AddUniquenessToPrivateSetUp < ActiveRecord::Migration[5.2]
  def change
    change_table :private_set_ups, bulk: true do |t|
      t.remove :coworking_id
      t.belongs_to :coworking, foreign_key: true, index: { unique: true }
    end
  end
end
