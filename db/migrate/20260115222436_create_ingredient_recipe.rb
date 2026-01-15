class CreateIngredientRecipe < ActiveRecord::Migration[8.1]
  def change
    create_table :ingredients_recipes do |t|
      t.belongs_to :ingredient
      t.belongs_to :recipe
    end
  end
end
