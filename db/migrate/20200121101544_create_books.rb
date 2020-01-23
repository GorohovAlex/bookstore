class CreateBooks < ActiveRecord::Migration[6.0]
  def change
    create_table :books do |t|
      t.string   :name
      t.monetize :price
      t.string   :description
      t.integer  :year_of_publication
      t.timestamps
    end
  end
end
