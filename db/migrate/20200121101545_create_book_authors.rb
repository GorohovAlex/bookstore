class CreateBookAuthors < ActiveRecord::Migration[6.0]
  def change
    create_table :book_authors do |t|
      t.references :book
      t.references :author

      t.timestamps
    end
  end
end
