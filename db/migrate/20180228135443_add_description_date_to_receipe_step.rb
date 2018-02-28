class AddDescriptionDateToReceipeStep < ActiveRecord::Migration[5.1]
  def change
    add_column :receipe_steps, :description, :text
  end
end
