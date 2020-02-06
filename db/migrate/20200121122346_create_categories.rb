class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :name, null: false, limit: Constants::TITLE_MAX_LENGTH

      t.timestamps
    end
  end
end
