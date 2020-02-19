class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :type, null: false
      t.string :first_name
      t.string :last_name
      t.string :address
      t.string :city
      t.string :zip
      t.string :country
      t.string :phone
      t.belongs_to :user
      t.index %i[user_id type], unique: true

      t.timestamps
    end
  end
end
