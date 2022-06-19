class Recipe < ApplicationRecord
  include ImageUploader::Attachment(:image)

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy

  paginates_per 20

  validates :title, presence: true, length: { maximum: 40 }
  validates :body, presence: true, length: { maximum: 200 }

  default_scope -> { order(created_at: :desc) }
end
