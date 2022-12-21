# frozen_string_literal: true

class AddImageDataToRecipes < ActiveRecord::Migration[7.0]
  def change
    add_column :recipes, :image_data, :text
  end
end
