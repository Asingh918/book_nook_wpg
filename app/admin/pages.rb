ActiveAdmin.register Page do
  permit_params :title, :content

  filter :slug
  filter :title

  index do
    selectable_column
    id_column
    column :slug
    column :title
    actions
  end

  form do |f|
    f.inputs do
      f.input :title
      f.input :content, as: :text, input_html: { rows: 10 }
    end
    f.actions
  end

  show do
    attributes_table do
      row :slug
      row :title
      row :content
    end
  end
end
