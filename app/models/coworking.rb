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
  after_create :initialize_coworking

  private
  def initialize_coworking
    initialize_availability_table
    initialize_public_set_up_table
    initialize_private_set_up_table
  end
  
  def initialize_availability_table
    unless self.availability
      new_availability = Availability.new(coworking: self, available_spots_quantity: 5, week_opening_time: "09:00", week_closing_time: "09:00", weekend_opening_time: "09:00", weekend_closing_time: "09:00")
      new_availability.save     
    end
  end
  
  def initialize_public_set_up_table
    new_public_set_up = PublicSetUp.new(coworking: self, bike_storage_id:1, coffee_access_id:1)
    new_public_set_up.save
  end
  
  def initialize_private_set_up_table
    new_private_set_up = PrivateSetUp.new(coworking: self)
    new_private_set_up.save
  end
  


end
