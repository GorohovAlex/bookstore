class CreateBestSellers < ActiveRecord::Migration[6.0]
  def change
    create_table :best_sellers do |t|
      t.references :book, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
