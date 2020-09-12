class AddOrderIdToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_reference :addresses, :order, foreign_key: true
  end
end
