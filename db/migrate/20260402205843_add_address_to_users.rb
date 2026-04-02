class AddAddressToUsers < ActiveRecord::Migration[7.2]
  def change
    add_column :users, :street, :string unless column_exists?(:users, :street)
    add_column :users, :city, :string unless column_exists?(:users, :city)
    add_column :users, :postal_code, :string unless column_exists?(:users, :postal_code)
    add_column :users, :province_id, :integer unless column_exists?(:users, :province_id)
  end
end
