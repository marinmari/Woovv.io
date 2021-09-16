# frozen_string_literal: true

class PrivateSetUp < ApplicationRecord
  belongs_to :coworking

  validates :manager_phone_number, format: { with: /\A(?:0|\+33 ?|0?0?33 ?|)([1-9] ?(?:[0-9] ?){8})\z/, message: "Nous avons besoin d'un numéro de téléphone au format 0XXXXXXXXX"  }, on: :update
end
