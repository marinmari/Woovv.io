# frozen_string_literal: true

class Availability < ApplicationRecord 
  belongs_to :coworking
  validates :is_open_monday?, presence: true, unless: :is_scrapped?
  validates :is_open_tuesday?, presence: true, unless: :is_scrapped?
  validates :is_open_wednesday?, presence: true, unless: :is_scrapped?
  validates :is_open_thursday?, presence: true, unless: :is_scrapped?
  validates :is_open_friday?, presence: true, unless: :is_scrapped?
  validates :is_open_saturday?, presence: true, unless: :is_scrapped?
  validates :is_open_sunday?, presence: true, unless: :is_scrapped?
   
  private
    def is_scrapped?
      Coworking.find(self.coworking_id)
    end 
end
