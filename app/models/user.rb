# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :bookings, foreign_key: 'coworker_id'
  belongs_to :company
  has_many :attended_coworkings, through: :bookings, source: :coworking
  has_many :managed_coworkings, class_name: "Coworking", foreign_key: "manager_id"
end
