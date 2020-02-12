class CreateAdress < ActiveRecord::Migration[6.0]
  def change
    create_table :adresses do |t|
      t.string :type, null: false
      t.string first_name
      t.string last_name
      t.string address
      t.string city
      t.string zip
      t.string country
      t.string phone
    end
  end
end
