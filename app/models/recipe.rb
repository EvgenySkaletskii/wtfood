class Recipe < ApplicationRecord
  include ImageUploader::Attachment(:image)

  paginates_per 20
  validates :title, presence: true, length: { maximum: 40 }
  validates :body, presence: true, length: { maximum: 200 }
  belongs_to :user
end
