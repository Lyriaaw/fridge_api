class AddQuantityToReceipeItems < ActiveRecord::Migration[5.1]
  def change
    add_column :receipe_items, :quantity, :float
  end
end
