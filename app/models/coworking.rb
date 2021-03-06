# frozen_string_literal: true

class Coworking < ApplicationRecord
  has_one :availability, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :coworkers, class_name: "User", through: :bookings
  belongs_to :coworking_manager, class_name: "User", optional: true
  belongs_to :managing_company, class_name: "Company"
  has_one :public_set_up, dependent: :destroy
  has_one :private_set_up, dependent: :destroy
  has_many_attached :coworking_pictures

  validates :zipcode, presence: true
  validates :name, presence: { message: "Nous avons besoin d'un nom de Coworking" }, on: :update
  validates :phone_number, format: { with: /\A(?:0|\+33 ?|0?0?33 ?|)([1-9] ?(?:[0-9] ?){8})\z/, message: "Nous avons besoin d'un numéro de téléphone au format 0XXXXXXXXX" }, on: :update
  validates :email, format: { with: /\A(\S+)@(.+)\.(\S+)\z/, message: "Nous avons besoin d'un email valide" }, on: :update
  after_create :initialize_coworking

  private

  def initialize_coworking
    initialize_availability_table
    initialize_public_set_up_table
    initialize_private_set_up_table
  end

  def initialize_availability_table
    unless availability
      new_availability = Availability.new(coworking: self, available_spots_quantity: 5, week_opening_time: "09:00", week_closing_time: "19:00", weekend_opening_time: "09:00", weekend_closing_time: "19:00")
      new_availability.save
    end
  end

  def initialize_public_set_up_table
    unless public_set_up
      new_public_set_up = PublicSetUp.new(coworking: self, bike_storage_id: 1, coffee_access_id: 1)
      new_public_set_up.save
    end
  end

  def initialize_private_set_up_table
    unless private_set_up
      new_private_set_up = PrivateSetUp.new(coworking: self)
      new_private_set_up.save
    end
  end
end
