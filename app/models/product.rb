class Product < ApplicationRecord
  belongs_to :category
  has_one_attached :image

  validates :title, presence: true
  validates :author, presence: true
  validates :description, presence: true
  validates :price_cents, presence: true, numericality: { greater_than: 0 }
  validates :stock_qty, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
  validates :active, inclusion: { in: [true, false] }

  def price
    price_cents / 100.0
  end

  def thumbnail
    image.variant(resize_to_fill: [300, 200]).processed
  end

  def large_image
    image.variant(resize_to_fill: [800, 400]).processed
  end

  def self.ransackable_attributes(auth_object = nil)
    ["id", "title", "author", "description", "price_cents", "stock_qty", "active", "on_sale", "category_id", "created_at", "updated_at"]
  end

  def self.ransackable_associations(auth_object = nil)
    ["category"]
  end
end
