class ChangeAddresses < ActiveRecord::Migration[6.0]
  def change
    change_table :addresses do |t|
      t.rename :user_id, :owner_id
    end

    add_column :addresses, :owner_type, :string
  end
end
