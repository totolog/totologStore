class AddSizeToCartItems < ActiveRecord::Migration[5.2]
  def change
    add_column :cart_items, :size, :float
  end
end
