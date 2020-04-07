class CreateOrderSummaries < ActiveRecord::Migration[6.0]
  def change
    create_table :order_summaries do |t|
      t.references :order, foreign_key: { on_delete: :cascade }
      t.string :item_name
      t.monetize :price

      t.timestamps
    end
  end
end
