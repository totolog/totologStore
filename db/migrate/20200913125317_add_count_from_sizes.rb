class AddCountFromSizes < ActiveRecord::Migration[5.2]
  def change
    add_column :sizes, :count, :integer
  end
end
