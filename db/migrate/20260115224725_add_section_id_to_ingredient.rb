class AddSectionIdToIngredient < ActiveRecord::Migration[8.1]
  def change
    add_reference :ingredients, :section, null: false, foreign_key: true
  end
end
