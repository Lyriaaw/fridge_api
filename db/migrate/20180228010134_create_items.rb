class CreateItems < ActiveRecord::Migration[5.1]
  def change
    drop_table :items
    create_table :items do |t|
      t.belongs_to :product, index: true

      t.timestamps
    end
  end
end
