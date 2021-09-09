class ChangeCompanyColumnName < ActiveRecord::Migration[5.2]
  def change
    change_table :companies, bulk: true do |t|
      t.rename :manager_id, :company_manager_id
    end
  end
end
