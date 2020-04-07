class CreateOrderCards < ActiveRecord::Migration[6.0]
  def change
    create_table :order_cards do |t|
      t.string :number
      t.string :name
      t.string :date_expiry
      t.string :cvv
      t.belongs_to :order, null: false, foreign_key: { on_delete: :cascade }

      t.timestamps
    end
  end
end
