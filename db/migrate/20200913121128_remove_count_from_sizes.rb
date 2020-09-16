class RemoveCountFromSizes < ActiveRecord::Migration[5.2]
  def change
    remove_column :sizes, :count, :integer
  end
end
