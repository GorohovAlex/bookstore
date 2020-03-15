class CreateCoupons < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons do |t|
      t.string   :value
      t.integer  :count
      t.integer  :discount
      t.boolean  :enabled

      t.timestamps
    end
  end
end
