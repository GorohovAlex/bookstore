class CreateOrderDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :order_deliveries do |t|
      t.references :order
      t.references :delivery

      t.timestamps
    end
  end
end
