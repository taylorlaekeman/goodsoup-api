class CreateIngredientShoppingList < ActiveRecord::Migration[8.1]
  def change
    create_table :ingredients_shopping_lists do |t|
      t.belongs_to :ingredient
      t.belongs_to :shopping_list
    end
  end
end
