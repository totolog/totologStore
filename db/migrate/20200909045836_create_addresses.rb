class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.string :user_id
      t.string :last_name
      t.string :first_name
      t.string :furi_last_name
      t.string :furi_first_name
      t.string :postal_code
      t.string :prefecture
      t.string :address

      t.timestamps
    end
  end
end
