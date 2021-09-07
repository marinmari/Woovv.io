class PublicSetUp < ApplicationRecord
  belongs_to :coworking
  belongs_to :bike_storage, class_name: "PublicSetUpAccess"
  belongs_to :coffee_access, class_name: "PublicSetUpAccess"

end
