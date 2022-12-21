# frozen_string_literal: true

class Product < ApplicationRecord
  has_many :ingredients
  has_many :recipes, through: :ingredients

  validates :name, presence: true, length: { maximum: 40 }
end
