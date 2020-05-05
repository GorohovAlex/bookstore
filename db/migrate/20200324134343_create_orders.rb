class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreign_key: { on_delete: :cascade }
      t.string :aasm_state
      t.string :number
      t.boolean :use_billing_address

      t.timestamps
    end
  end
end
