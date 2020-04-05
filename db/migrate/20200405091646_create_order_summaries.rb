class CreateOrderSummaries < ActiveRecord::Migration[6.0]
  def change
    create_table :order_summaries do |t|
      t.references :order, null: false, foreign_key: true, on_delete: :cascade
      t.string :item_name
      t.monetize :value

      t.timestamps
    end
  end
end
