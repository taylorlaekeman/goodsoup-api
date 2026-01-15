class CreateRecipeShoppingList < ActiveRecord::Migration[8.1]
  def change
    create_table :recipes_shopping_lists do |t|
      t.belongs_to :recipe
      t.belongs_to :shopping_list
    end
  end
end
