# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_section, SectionType, null: false do
      argument :name, String, required: true
    end
    def create_section(name:)
      Section.create!(name: name)
    end

    field :create_ingredient, IngredientType, null: false do
      argument :name, String, required: true
      argument :section, ID, required: true
    end
    def create_ingredient(name:, section:)
      Ingredient.create!(name: name, section_id: section)
    end

    field :create_recipe, RecipeType, null: false do
      argument :name, String, required: true
      argument :ingredients, [ID], required: true
    end
    def create_recipe(name:, ingredients:)
      Recipe.create!(name: name, ingredient_ids: ingredients)
    end

    field :create_shopping_list, ShoppingListType, null: false do
      argument :name, String, required: false
      argument :recipes, [ID], required: false
      argument :ingredients, [ID], required: false
    end
    def create_shopping_list(name: nil, recipes: [], ingredients: [])
      ShoppingList.create!(name: name, recipe_ids: recipes, ingredient_ids: ingredients)
    end
  end
end
