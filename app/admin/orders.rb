ActiveAdmin.register Order do
  permit_params :status

  filter :status
  filter :created_at

  index do
    selectable_column
    id_column
    column :user
    column :status do |order|
      status_color = case order.status
      when "paid" then "green"
      when "shipped" then "blue"
      when "pending" then "orange"
      else "gray"
      end
      span order.status.capitalize, style: "color:#{status_color}; font-weight:bold;"
    end
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
    f.inputs "Update Order Status" do
      f.input :status, as: :select,
        collection: [ "pending", "paid", "shipped" ],
        include_blank: false
    end
    f.actions
  end

  member_action :mark_paid, method: :put do
    resource.update!(status: "paid")
    redirect_to admin_order_path(resource), notice: "Order marked as paid!"
  end

  member_action :mark_shipped, method: :put do
    resource.update!(status: "shipped")
    redirect_to admin_order_path(resource), notice: "Order marked as shipped!"
  end

  action_item :mark_paid, only: :show do
    link_to "Mark as Paid", mark_paid_admin_order_path(order), method: :put if order.status == "pending"
  end

  action_item :mark_shipped, only: :show do
    link_to "Mark as Shipped", mark_shipped_admin_order_path(order), method: :put if order.status == "paid"
  end
end
