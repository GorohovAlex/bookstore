ActiveAdmin.register Category do
  config.filters = false

  permit_params :name

  index do
    selectable_column
    column :name
    actions
  end

  show title: :name do
    attributes_table do
      row :name
      row :created_at
      row :updated_at
    end
  end
end
