class RemoveImageNameColumnFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_column :products, :image_name, :varchar
  end
end
