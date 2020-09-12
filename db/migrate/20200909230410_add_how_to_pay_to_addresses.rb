class AddHowToPayToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :how_to_pay, :string
  end
end
