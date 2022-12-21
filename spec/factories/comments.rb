# frozen_string_literal: true

FactoryBot.define do
  factory :comment do
    user
    recipe
    body { Faker::Lorem.sentence }

    trait :liked do
      like
    end
  end
end
