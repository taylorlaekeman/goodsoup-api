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
    def update_section(id:, name: nil)
      section = Section.find(id)
      input = { name: name }.compact
      section.update!(input)
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
    def update_ingredient(id:, name: nil, section: nil)
      ingredient = Ingredient.find(id)
      input = { name: name, section_id: section }.compact
      ingredient.update!(input)
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
    def update_recipe(id:, name: nil, ingredients: nil)
      recipe = Recipe.find(id)
      input = { name: name, ingredient_ids: ingredient }.compact
      recipe.update!(input)
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
      argument :id, ID, required: true
      argument :name, String, required: false
      argument :recipes, [ID], required: false
      argument :ingredients, [ID], required: false
    end
    def update_shopping_list(id:, name: nil, recipes: nil, ingredients: nil)
      shopping_list = ShoppingList.find(id)
      input = { name: name, recipe_ids: recipes, ingredient_ids: ingredients }.compact
      shopping_list.update!(input)
      shopping_list
    end

    field :delete_shopping_list, ShoppingListType, null: false do
      argument :id, ID, required: true
    end
    def delete_shopping_list(id:)
      shopping_list = ShoppingList.find(id)
      shopping_list.destroy!
      shopping_list
    end
  end
end
