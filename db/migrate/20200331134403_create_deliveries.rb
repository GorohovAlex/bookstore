class CreateDeliveries < ActiveRecord::Migration[6.0]
  def change
    create_table :deliveries do |t|
      t.string :name
      t.text :days
      t.monetize :price

      t.timestamps
    end
  end
end
