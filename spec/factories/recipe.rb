FactoryBot.define do
  factory :recipe do
    title { Faker::Food.dish }
    body { Faker::Food.description }
    user

    factory :recipe_with_ingredients do
      transient do
        ingredients_count { 1 }
      end

      ingredients do
        Array.new(ingredients_count) { association(:ingredient) }
      end
    end
  end
end
