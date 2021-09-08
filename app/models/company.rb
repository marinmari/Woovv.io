# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :coworkings, foreign_key: "managing_company_id"
  has_many :employees, class_name: "User", dependent: :nullify
end
