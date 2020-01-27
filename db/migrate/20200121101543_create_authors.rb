class CreateAuthors < ActiveRecord::Migration[6.0]
  NAME_MAX_LENGTH = 255

  def change
    create_table :authors do |t|
      t.string :first_name, null: false, limit: NAME_MAX_LENGTH
      t.string :last_name, null: false, limit: NAME_MAX_LENGTH

      t.timestamps
    end
  end
end
