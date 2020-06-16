class ChangeForeignKeyForOrderItems < ActiveRecord::Migration[6.0]
  def change
    change_column_null :order_items, :book_id, true
    remove_foreign_key :order_items, column: :book_id
    add_foreign_key :order_items, :books, on_delete: :cascade
  end
end
