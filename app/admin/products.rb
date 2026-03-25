ActiveAdmin.register Product do
  permit_params :title, :author, :description, :price_cents, :stock_qty, :active, :category_id, :image

  index do
    selectable_column
    id_column
    column :title
    column :author
    column :category
    column :price_cents
    column :stock_qty
    column :active
    column :image do |product|
      if product.image.attached?
        image_tag url_for(product.image), style: "height:50px; width:auto;"
      else
        "No image"
      end
    end
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :author
      f.input :description
      f.input :price_cents
      f.input :stock_qty
      f.input :active
      f.input :category
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
      row :category
      row :image do |product|
        if product.image.attached?
          image_tag url_for(product.image), style: "max-height:200px; width:auto;"
        else
          "No image"
        end
      end
    end
  end
end
