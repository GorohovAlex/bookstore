ActiveAdmin.register Author do
  config.filters = false

  decorate_with AuthorDecorator

  permit_params :first_name, :last_name

  index do
    selectable_column
    column :first_name
    column :last_name
    actions
  end

  show title: :full_name do
    attributes_table do
      row :first_name
      row :last_name
      row :created_at
      row :updated_at
    end
  end
end
