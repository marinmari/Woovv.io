# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, foreign_key: 'coworker_id', dependent: :destroy, inverse_of: 'coworker'
  belongs_to :company, optional: true
  has_many :attended_coworkings, through: :bookings, source: :coworking
  has_many :managed_coworkings, class_name: "Coworking", foreign_key: "coworking_manager_id", dependent: :nullify, inverse_of: 'coworking_manager'
  has_one :managed_company, class_name: "Company", foreign_key: "company_manager_id", dependent: :nullify, inverse_of: 'company_manager'

end
