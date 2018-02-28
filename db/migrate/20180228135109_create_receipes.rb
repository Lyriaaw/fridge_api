class CreateReceipes < ActiveRecord::Migration[5.1]
  def change
    create_table :receipes do |t|
      t.string :name
      t.string :description
      t.integer :people

      t.timestamps
    end
  end
end
