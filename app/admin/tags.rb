ActiveAdmin.register Tag do
  permit_params :name

  filter :name

  index do
    selectable_column
    id_column
    column :name
    column :products_count do |tag|
      tag.products.count
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :created_at
    end

    panel "Products with this tag" do
      table_for tag.products do
        column :title
        column :author
      end
    end
  end
end
