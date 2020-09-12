class ChangeOdersToOrders < ActiveRecord::Migration[5.2]
  def change
    rename_table :oders, :orders
  end
end
