class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: true
      t.string :aasm_state
      t.boolean :use_billing_address

      t.timestamps
    end
  end
end
