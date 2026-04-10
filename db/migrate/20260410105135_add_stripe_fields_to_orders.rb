class AddStripeFieldsToOrders < ActiveRecord::Migration[7.2]
  def change
    add_column :orders, :stripe_payment_id, :string
    add_column :orders, :stripe_customer_id, :string
  end
end
