class Ingredient < ApplicationRecord
  has_and_belongs_to_many :recipes
  belongs_to :section
  has_and_belongs_to_many :shopping_lists
end
