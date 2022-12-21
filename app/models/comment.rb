# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe
  has_many :likes, as: :likeable, dependent: :destroy

  validates :body, presence: true, length: { maximum: 200 }
  validates :user_id, presence: true
  validates :recipe_id, presence: true

  default_scope -> { order(created_at: :desc) }
end
