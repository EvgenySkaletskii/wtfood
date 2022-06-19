class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :recipe

  validates :body, presence: true, length: { maximum: 200 }
  validates :user_id, presence: true
  validates :recipe_id, presence: true

  default_scope -> { order(created_at: :desc) }
end
