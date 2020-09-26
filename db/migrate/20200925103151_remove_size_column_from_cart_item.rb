class RemoveSizeColumnFromCartItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :cart_items, :size, :float
  end
end
