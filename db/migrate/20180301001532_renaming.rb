class Renaming < ActiveRecord::Migration[5.1]
  def change
    rename_column :recipes_items, :receipe_id, :recipe_id
    rename_column :recipes_steps, :receipe_id, :recipe_id
  end
end
