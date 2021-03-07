class CreateCoupons < ActiveRecord::Migration[6.0]
  def change
    create_table :coupons do |t|
      t.string   :name
      t.integer  :count
      t.integer  :discount
      t.boolean  :enabled
      t.index    [:name], unique: true
      t.timestamps
    end
  end
end
