# frozen_string_literal: true

class AddScrappingStatusToCoworking < ActiveRecord::Migration[5.2]
  def change
    # This attribute is set to secure high quality data when coworking info is not coming from scrapping
    add_column :coworkings, :is_from_scrapping?, :boolean, default: false
  end
end
