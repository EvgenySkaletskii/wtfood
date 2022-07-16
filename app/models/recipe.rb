class Recipe < ApplicationRecord
  include ImageUploader::Attachment(:image)

  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :likes, as: :likeable, dependent: :destroy
  has_many :ingredients, dependent: :destroy
  has_many :products, through: :ingredients
  accepts_nested_attributes_for :ingredients,
    reject_if: :all_blank, allow_destroy: true

  before_save :find_or_create_products

  paginates_per 20

  validates :title, presence: true, length: { maximum: 40 }
  validates :body, presence: true, length: { maximum: 200 }

  default_scope -> { order(created_at: :desc) }

  private

  def find_or_create_products
    self.ingredients.each do |ingredient|
      ingredient.product = Product.find_or_create_by(name: ingredient.product.name)
    end
  end
end
