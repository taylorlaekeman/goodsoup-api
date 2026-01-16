# frozen_string_literal: true

module Types
  class MutationType < Types::BaseObject
    field :create_section, SectionType, null: false do
      argument :name, String, required: true
    end
    def create_section(name:)
      Section.create!(name: name)
    end

    field :update_section, SectionType, null: false do
      argument :id, ID, required: true
      argument :name, String, required: true
    end
    def update_section(id:, name:)
      section = Section.find(id)
      section.update!(name: name)
      section
    end

    field :create_ingredient, IngredientType, null: false do
      argument :name, String, required: true
      argument :section, ID, required: true
    end
    def create_ingredient(name:, section:)
      Ingredient.create!(name: name, section_id: section)
    end

    field :update_ingredient, IngredientType, null: false do
      argument :id, ID, required: true
      argument :name, String, required: true
      argument :section, ID, required: true
    end
    def update_ingredient(id:, name:, section:)
      ingredient = Ingredient.find(id)
      ingredient.update!(name: name, section_id: section)
      ingredient
    end

    field :create_recipe, RecipeType, null: false do
      argument :name, String, required: true
      argument :ingredients, [ID], required: true
    end
    def create_recipe(name:, ingredients:)
      Recipe.create!(name: name, ingredient_ids: ingredients)
    end

    field :update_recipe, RecipeType, null: false do
      argument :id, ID, required: true
      argument :name, String, required: true
      argument :ingredients, [ID], required: true
    end
    def update_recipe(id:, name:, ingredients:)
      recipe = Recipe.find(id)
      recipe.update!(name: name, ingredient_ids: ingredients)
      recipe
    end

    field :create_shopping_list, ShoppingListType, null: false do
      argument :name, String, required: false
      argument :recipes, [ID], required: false
      argument :ingredients, [ID], required: false
    end
    def create_shopping_list(name: nil, recipes: [], ingredients: [])
      ShoppingList.create!(name: name, recipe_ids: recipes, ingredient_ids: ingredients)
    end

    field :update_shopping_list, ShoppingListType, null: false do
      argument :id, ID, required: false
      argument :name, String, required: false
      argument :recipes, [ID], required: false
      argument :ingredients, [ID], required: false
    end
    def update_shopping_list(id:, name:, recipes:, ingredients:)
      shopping_list = ShoppingList.find(id)
      shopping_list.update!(name: name, recipe_ids: recipes, ingredient_ids: ingredients)
      shopping_list
    end
  end
end
