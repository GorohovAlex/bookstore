# rubocop:disable Metrics/BlockLength
ActiveAdmin.register Book do
  decorate_with BookDecorator
  includes :category, :book_authors, :authors

  config.filters = false

  index do
    selectable_column
    column :name
    column t('.description'), :description_begin
    column :category
    column t('.authors'), :authors_show
    column t('.price'), :price_show
    actions
  end

  show do
    attributes_table do
      row :name
      row :authors_show
      row :description
      row 'Price' do
        :price_show
      end
      row :year_of_publication
      row :materials_show
      row :dimensions_show
    end
  end

  permit_params :name, :price, :price_currency, :description, :year_of_publication, :category_id, :book_dimension,
                :materials, :authors, author_ids: [], material_ids: []

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :name
      f.input :authors, collection: Hash[Author.all.map { |author| [author.decorate.full_name, author.id] }]
      f.input :price, :description
      f.input :year_of_publication
      f.input :materials
      f.inputs t('.dimensions'), for: [:book_dimension, f.object.book_dimension] do |t|
        t.input :height
        t.input :width
        t.input :depth
      end
    end
    f.actions
  end
end
# rubocop:enable Metrics/BlockLength
