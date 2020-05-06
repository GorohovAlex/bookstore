class CreateBestSellers < ActiveRecord::Migration[6.0]
  def change
    create_table :best_sellers do |t|
      t.references :category, foreign_key: { on_delete: :cascade }, index: { unique: true }
      t.references :book, foreign_key: { on_delete: :nullify }

      t.timestamps
    end
  end
end
