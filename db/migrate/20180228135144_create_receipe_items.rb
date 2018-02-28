class CreateReceipeItems < ActiveRecord::Migration[5.1]
  def change
    create_table :receipe_items do |t|
      t.belongs_to :product, index: true
      t.belongs_to :receipe, index: true

      t.timestamps
    end
  end
end
