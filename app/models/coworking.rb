class Coworking < ApplicationRecord
  has_one :availability, foreign_key: 'coworking_id', dependent: :destroy
  has_many :bookings, foreign_key: 'coworking_id', dependent: :destroy
  has_many :coworkers, class_name: "User", through: :bookings
  belongs_to :manager, class_name: "User"
  has_one :public_set_up, foreign_key: 'coworking_id'
  has_one :private_set_up, foreign_key: 'coworking_id'

end
