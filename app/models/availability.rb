# frozen_string_literal: true

class Availability < ApplicationRecord
  belongs_to :coworking
  validates :is_open_monday?, inclusion: { in: [true, false] }, unless: :is_scrapped?
  validates :is_open_tuesday?, inclusion: { in: [true, false] }, unless: :is_scrapped?
  validates :is_open_wednesday?, inclusion: { in: [true, false] }, unless: :is_scrapped?
  validates :is_open_thursday?, inclusion: { in: [true, false] }, unless: :is_scrapped?
  validates :is_open_friday?, inclusion: { in: [true, false] }, unless: :is_scrapped?
  validates :is_open_saturday?, inclusion: { in: [true, false] }, unless: :is_scrapped?
  validates :is_open_sunday?, inclusion: { in: [true, false] }, unless: :is_scrapped?

  validates :available_spots_quantity, format: { with: /\A[1-9]?[0-9]{1}$|^100\z/, message: "Le nombre de places doit être compris entre 0 et 100" }, on: :update
  validates :price_per_spot_per_day, format: { with: /\A[1-9]?[0-9]{1}$|^100\z/, message: "Le prix doit être compris entre 0 et 100" }, on: :update

  private

  def is_scrapped?
    Coworking.find(coworking_id).is_from_scrapping?
  end
end
