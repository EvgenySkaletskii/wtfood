FactoryBot.define do
  factory :ingredient do
    amount { Faker::Food.measurement }
  end
end
