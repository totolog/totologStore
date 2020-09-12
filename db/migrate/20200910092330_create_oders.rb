class CreateOders < ActiveRecord::Migration[5.2]
  def change
    create_table :oders do |t|
      t.references :product, foreign_key: true
      t.integer :quantity
      t.references :address, foreign_key: true

      t.timestamps
    end
  end
end
