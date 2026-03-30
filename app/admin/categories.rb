ActiveAdmin.register Category do
  permit_params :name, :description

  filter :name

  index do
    selectable_column
    id_column
    column :name
    column :description
    column :products_count do |category|
      category.products.count
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description
      row :created_at
    end

    panel "Products in this Category" do
      table_for category.products do
        column :title
        column :author
        column :price_cents
        column :active
      end
    end
  end
end
