FactoryBot.define do
  factory :like do
    user

    trait :for_recipe do
      association :likeable, factory: :recipe
    end

    trait :for_comment do
      association :likeable, factory: :comments
    end
  end
end
