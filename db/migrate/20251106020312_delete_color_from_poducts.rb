class DeleteColorFromPoducts < ActiveRecord::Migration[8.0]
  def change
    remove_column :products, :color, :string
  end
end
