# frozen_string_literal: true

class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users, bulk: true do |t|
      t.string :first_name
      t.string :last_name
      t.datetime :birth_date
      t.string :phone_number
      t.string :gender
      t.boolean :is_independent?
      t.boolean :is_validated?
      t.belongs_to :company, foreign_key: { to_table: :companies }, index: true
    end
  end
end
