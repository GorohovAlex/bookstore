class CreateJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :books, :authors do |t|
      t.index :author_id
      t.index :book_id
    end
  end
end
