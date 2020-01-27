class CreateBooks < ActiveRecord::Migration[6.0]
  NAME_MAX_LENGTH = 255

  def change
    create_table :books do |t|
      t.string   :name, null: false, limit: NAME_MAX_LENGTH
      t.monetize :price
      t.string   :description
      t.integer  :year_of_publication
      t.timestamps
    end
  end
end
