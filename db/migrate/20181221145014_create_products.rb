class CreateProducts < ActiveRecord::Migration[5.1]
  def change
    create_table :products do |t|
      t.string :Name
      t.string :Category
      t.decimal :Price
      t.integer :Quantity
      t.decimal :Discount
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
