class ChangeColumnName < ActiveRecord::Migration[5.1]
  def change
   rename_column :products, :Name, :name
   rename_column :products, :Category, :category
   rename_column :products, :Price, :price
   rename_column :products, :Quantity, :quantity
   rename_column :products, :Discount, :discount
  end
end
