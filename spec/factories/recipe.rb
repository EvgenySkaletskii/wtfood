FactoryBot.define do
  factory :recipe do
    title { Faker::Food.dish }
    body { Faker::Food.description }
    user
  end
end
