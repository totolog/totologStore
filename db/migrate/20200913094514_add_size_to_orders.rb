class AddSizeToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :size, :float
  end
end
