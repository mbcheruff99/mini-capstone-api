class AddInventoryToProducts < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :inventory, :integer
  end
end
