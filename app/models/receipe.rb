class Receipe < ApplicationRecord
  has_many :receipe_items, :class_name => "ReceipeItem", :foreign_key => "receipe_id"
  has_many :receipe_steps, autosave: true
end
