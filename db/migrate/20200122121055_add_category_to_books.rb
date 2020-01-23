class AddCategoryToBooks < ActiveRecord::Migration[6.0]
  def change
    add_reference :books, :category, index: true
  end
end
