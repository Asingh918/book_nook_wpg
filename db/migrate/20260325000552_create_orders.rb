class CreateOrders < ActiveRecord::Migration[7.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :status
      t.integer :subtotal_cents
      t.integer :tax_cents
      t.integer :total_cents
      t.integer :province_id
      t.string :street
      t.string :city
      t.string :postal_code

      t.timestamps
    end
  end
end
