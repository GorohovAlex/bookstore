class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title, null: false
      t.string :review, null: false
      t.integer :rating, null: false
      t.integer :status, null: false, default: 0
      t.belongs_to :book, foreign_key: { on_delete: :cascade }
      t.belongs_to :user, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
