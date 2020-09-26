class RemoveSizeColumnFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :size, :float
  end
end
