class CreateCoworkings < ActiveRecord::Migration[5.2]
  def change
    create_table :coworkings do |t|
      t.string :name
      t.text :description
      t.string :address
      t.string :city
      t.string :zipcode
      t.string :country
      t.string :state
      t.string :phone_number
      t.string :email
      t.boolean :is_operational?
      t.belongs_to :managing_company, foreign_key: {to_table: :companies}, index: true

      t.timestamps
    end
  end
end
