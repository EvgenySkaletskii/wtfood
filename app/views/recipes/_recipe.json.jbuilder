# frozen_string_literal: true

json.extract! recipe, :id, :title, :body, :user_id, :created_at, :updated_at
json.url recipe_url(recipe, format: :json)
