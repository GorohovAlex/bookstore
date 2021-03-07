class AddCategoryToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :category, foreign_key: { on_delete: :nullify }
  end
end
