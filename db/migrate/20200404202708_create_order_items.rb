class CreateOrderItems < ActiveRecord::Migration[6.0]
  def change
    create_table :order_items do |t|
      t.references :order, foreign_key: { on_delete: :cascade }
      t.references :book, null: false, foreign_key: true, on_delete: :nullify
      t.string :title
      t.integer :quantity
      t.monetize :price

      t.timestamps
    end
  end
end
