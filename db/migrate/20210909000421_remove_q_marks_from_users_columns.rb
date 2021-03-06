# frozen_string_literal: true

class RemoveQMarksFromUsersColumns < ActiveRecord::Migration[5.2]
  def change
    change_table :users, bulk: true do |t|
      t.rename :is_independent?, :is_independent
      t.rename :is_validated?, :is_validated
    end
  end
end
