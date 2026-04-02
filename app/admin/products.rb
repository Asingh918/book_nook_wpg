ActiveAdmin.register Product do
  permit_params :title, :author, :description, :price_cents, :stock_qty, :active, :on_sale, :category_id, :image, tag_ids: []

  filter :title
  filter :author
  filter :category
  filter :active
  filter :on_sale

  index do
    selectable_column
    id_column
    column :title
    column :author
    column :category
    column :price_cents
    column :stock_qty
    column :active
    column :on_sale
    column :tags do |product|
      product.tags.map(&:name).join(", ")
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :author
      f.input :description
      f.input :price_cents, hint: "e.g. 1499 = $14.99"
      f.input :stock_qty
      f.input :active
      f.input :on_sale
      f.input :category
      f.input :tags, as: :check_boxes, collection: Tag.all
      f.input :image, as: :file
    end
    f.actions
  end

  show do
    attributes_table do
      row :title
      row :author
      row :description
      row :price_cents
      row :stock_qty
      row :active
      row :on_sale
      row :category
      row :tags do |product|
        product.tags.map(&:name).join(", ")
      end
    end
  end
end
