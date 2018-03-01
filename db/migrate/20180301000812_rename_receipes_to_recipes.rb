class RenameReceipesToRecipes < ActiveRecord::Migration[5.1]
  def change
    rename_table :receipes, :recipes
    rename_table :receipe_steps, :recipes_steps
    rename_table :receipe_items, :recipes_items
  end
end
