class CreateMaterials < ActiveRecord::Migration[6.0]
  NAME_MAX_LENGTH = 255

  def change
    create_table :materials do |t|
      t.string :name, null: false, limit: NAME_MAX_LENGTH

      t.timestamps
    end
  end
end
