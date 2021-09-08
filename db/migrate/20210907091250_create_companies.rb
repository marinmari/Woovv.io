# frozen_string_literal: true

class CreateCompanies < ActiveRecord::Migration[5.2]
  def change
    create_table :companies do |t|
      t.string :commercial_name
      t.string :legal_name
      t.string :legal_address
      t.string :legal_zipcode
      t.string :legal_city
      t.string :legal_country
      t.string :legal_state
      t.string :siret
      t.string :email
      t.belongs_to :manager, foreign_key: { to_table: :users }, index: true

      t.timestamps
    end
  end
end
