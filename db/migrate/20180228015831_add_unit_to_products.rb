class AddUnitToProducts < ActiveRecord::Migration[5.1]
  def change
    add_column :products, :unit, :text
  end
end
