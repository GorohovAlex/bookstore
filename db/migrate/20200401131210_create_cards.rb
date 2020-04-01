class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.string :number
      t.string :name
      t.date :date_expiry
      t.string :cvv
      t.belongs_to :order, null: false, foreign_key: true

      t.timestamps
    end
  end
end
