class AddAmountToIngredients < ActiveRecord::Migration[7.0]
  def change
    add_column :ingredients, :amount, :string
  end
end
