class AddForgetAttributesMailerToUsers < ActiveRecord::Migration[5.2]
  def change
    change_table :users, bulk: true do |t|
      t.string   :unconfirmed_email 
    end
  end
end