FactoryBot.define do
  factory :product do
    name { Faker::Food.ingredient }
  end
end
