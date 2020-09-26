class RemoveNameColumnFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :name, :varchar
  end
end
