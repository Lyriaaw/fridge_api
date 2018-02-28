class CreateItems < ActiveRecord::Migration[5.1]
  def change
    drop_table :items
    create_table :items do |t|
      t.float :quantity
      t.belongs_to :fridge, index: true
      t.belongs_to :product, index: true
      t.timestamp :limit_date



      t.timestamps
    end
  end
end
