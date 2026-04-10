class Order < ApplicationRecord
  belongs_to :user
  belongs_to :province
  has_many :order_items

  validates :status, presence: true
  validates :subtotal_cents, presence: true
  validates :tax_cents, presence: true
  validates :total_cents, presence: true

  def self.ransackable_attributes(auth_object = nil)
    [ "id", "user_id", "status", "subtotal_cents", "tax_cents", "total_cents", "created_at", "stripe_payment_id" ]
  end

  def self.ransackable_associations(auth_object = nil)
    [ "user", "order_items", "province" ]
  end
end
