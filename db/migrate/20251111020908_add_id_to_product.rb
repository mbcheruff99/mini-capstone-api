class AddIdToProduct < ActiveRecord::Migration[8.0]
  def change
    add_column :products, :supplier_id, :string
  end
end
