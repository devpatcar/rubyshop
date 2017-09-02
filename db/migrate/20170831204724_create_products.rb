class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :name
      t.text :description
      t.string :image
      t.integer :price
      t.integer :stock

      t.timestamps
    end
  end
end
