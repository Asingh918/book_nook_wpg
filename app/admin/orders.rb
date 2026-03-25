ActiveAdmin.register Order do
  permit_params :status

  filter :status
  filter :user
  filter :created_at

  index do
    selectable_column
    id_column
    column :user
    column :status
    column :subtotal_cents
    column :tax_cents
    column :total_cents
    column :created_at
    actions
  end

  show do
    attributes_table do
      row :id
      row :user
      row :status
      row :subtotal_cents
      row :tax_cents
      row :total_cents
      row :street
      row :city
      row :postal_code
      row :province
      row :created_at
    end

    panel "Order Items" do
      table_for order.order_items do
        column :product
        column :quantity
        column :unit_price_cents
        column :tax_rate
      end
    end
  end

  form do |f|
    f.inputs do
      f.input :status, as: :select, collection: ['pending', 'paid', 'shipped']
    end
    f.actions
  end
end
