class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :type,       null: false
      t.string :first_name, null: false, limit: AddressForm::DEFAULT_MAX_LENGTH
      t.string :last_name,  null: false, limit: AddressForm::DEFAULT_MAX_LENGTH
      t.string :address,    null: false, limit: AddressForm::DEFAULT_MAX_LENGTH
      t.string :city,       null: false, limit: AddressForm::DEFAULT_MAX_LENGTH
      t.string :zip,        null: false, limit: AddressForm::ZIP_MAX_LENGTH
      t.string :country,    null: false, limit: AddressForm::DEFAULT_MAX_LENGTH
      t.string :phone,      null: false, limit: AddressForm::PHONE_MAX_LENGTH
      t.belongs_to :user
      t.index %i[user_id type], unique: true

      t.timestamps
    end
  end
end
