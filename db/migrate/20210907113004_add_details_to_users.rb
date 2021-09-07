class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :birth_date, :datetime
    add_column :users, :phone_number, :string
    add_column :users, :gender, :string
    add_reference :users, :company, foreign_key: {to_table: :companies}, index: true
    add_reference :coworkings, :manager, foreign_key: {to_table: :users}, index: true
    add_reference :companies, :manager, foreign_key: {to_table: :users}, index: true
    add_column :users, :is_independant?, :boolean
    add_column :users, :is_validated?, :boolean

  end
end
