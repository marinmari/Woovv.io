# frozen_string_literal: true

class Availability < ApplicationRecord 
  belongs_to :coworking
  validates :is_open_monday?, inclusion: { in:[true, false] }, unless: :is_scrapped?
  validates :is_open_tuesday?, inclusion: { in:[true, false] }, unless: :is_scrapped?
  validates :is_open_wednesday?, inclusion: { in:[true, false] }, unless: :is_scrapped?
  validates :is_open_thursday?, inclusion: { in:[true, false] }, unless: :is_scrapped?
  validates :is_open_friday?, inclusion: { in:[true, false] }, unless: :is_scrapped?
  validates :is_open_saturday?, inclusion: { in:[true, false] }, unless: :is_scrapped?
  validates :is_open_sunday?, inclusion: { in:[true, false] }, unless: :is_scrapped?
   
  private
    def is_scrapped?
      Coworking.find(self.coworking_id).is_from_scrapping?
    end

end
