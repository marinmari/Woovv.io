class Coworking < ApplicationRecord
  has_one :availability, foreign_key: 'coworking_id', dependent: :destroy
  has_many :bookings, foreign_key: 'coworking_id', dependent: :destroy

end
