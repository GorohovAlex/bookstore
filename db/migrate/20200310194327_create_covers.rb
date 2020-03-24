class CreateCovers < ActiveRecord::Migration[6.0]
  def change
    create_table :covers do |t|
      t.belongs_to :book, foreign_key: { on_delete: :cascade }
      t.text :image_data

      t.timestamps
    end
  end
end
