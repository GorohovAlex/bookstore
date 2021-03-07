class CreateBookDimensions < ActiveRecord::Migration[6.0]
  def change
    create_table :book_dimensions do |t|
      t.belongs_to :book, null: false, foreign_key: true
      t.decimal :height, precision: 6, scale: 1
      t.decimal :width, precision: 6, scale: 1
      t.decimal :depth, precision: 6, scale: 1

      t.timestamps
    end
  end
end
