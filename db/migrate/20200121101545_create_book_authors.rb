class CreateBookAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :book_authors do |t|
      t.references :book, foreign_key: { on_delete: :cascade }
      t.references :author, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
