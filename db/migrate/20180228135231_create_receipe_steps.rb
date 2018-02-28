class CreateReceipeSteps < ActiveRecord::Migration[5.1]
  def change
    create_table :receipe_steps do |t|
      t.belongs_to :receipe, index: true

      t.timestamps
    end
  end
end
