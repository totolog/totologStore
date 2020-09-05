class CreateImages < ActiveRecord::Migration[5.2]
  def change
    create_table :images do |t|
      t.integer :product_id
      t.string :name1
      t.string :name2
      t.string :name3
      t.string :name4

      t.timestamps
    end
  end
end
