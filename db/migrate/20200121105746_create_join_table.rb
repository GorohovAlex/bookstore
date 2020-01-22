class CreateJoinTable < ActiveRecord::Migration[6.0]
  def change
    create_join_table :books, :authors do |t|
      t.index %i[book_id authors_id]
      t.index %i[authors_id book_id]
    end
  end
end
