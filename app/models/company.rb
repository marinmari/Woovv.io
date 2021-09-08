# frozen_string_literal: true

class Company < ApplicationRecord
  has_many :coworkings, foreign_key: "managing_company_id", dependent: :destroy, inverse_of: 'managing_company'
  has_many :employees, class_name: "User", dependent: :nullify
  belongs_to :manager, class_name: "User", optional: true
end
