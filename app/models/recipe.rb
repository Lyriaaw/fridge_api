class Recipe < ApplicationRecord
  has_many :recipes_items, :class_name => "RecipesItems", :foreign_key => "recipe_id"
  has_many :recipes_steps, :class_name => "RecipesSteps", :foreign_key => "recipe_id"
end
