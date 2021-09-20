# frozen_string_literal: true

class AddUniquenessToCompaniesManager < ActiveRecord::Migration[5.2]
  def change
    change_table :companies, bulk: true do |t|
      t.remove :company_manager_id
      t.belongs_to :company_manager, foreign_key: { to_table: :users }, index: { unique: true }
    end
  end
end
