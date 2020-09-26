class CreateCounts < ActiveRecord::Migration[5.2]
  def change
    create_table :counts do |t|
      # t.references :size, foreign_key: true
      # t.integer :count

      # t.timestamps
    end
  end
end
