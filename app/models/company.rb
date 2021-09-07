class Company < ApplicationRecord
  has_many :coworkings, foreign_key: "managing_company_id"
  has_many :employees, foreign_key: "company_id", class_name: "User"

end
