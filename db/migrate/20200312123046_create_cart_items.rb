class CreateCartItems < ActiveRecord::Migration[6.0]
  def change
    create_table :cart_items do |t|
      t.references :user, null: true, foreign_key: true
      t.string :session_id
      t.references :book, null: false, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
