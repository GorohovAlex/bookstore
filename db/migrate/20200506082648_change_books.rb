class ChangeBooks < ActiveRecord::Migration[6.0]
  def change
    add_column :books, :order_items_count, :integer
  end
end
