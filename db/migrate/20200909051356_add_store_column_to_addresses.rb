class AddStoreColumnToAddresses < ActiveRecord::Migration[5.2]
  def change
    add_column :addresses, :store, :boolean, default: false, null: false
  end
end
