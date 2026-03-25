class OrderItem < ApplicationRecord
  belongs_to :order
  belongs_to :product

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :unit_price_cents, presence: true
  validates :tax_rate, presence: true

  def subtotal
    unit_price_cents * quantity
  end
end
