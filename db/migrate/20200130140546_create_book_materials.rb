class CreateBookMaterials < ActiveRecord::Migration[6.0]
  def change
    create_table :books_materials do |t|
      t.belongs_to :book, foreign_key: { on_delete: :cascade }
      t.belongs_to :material, foreign_key: { on_delete: :cascade }
    end
  end
end
