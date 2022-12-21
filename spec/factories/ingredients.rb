# frozen_string_literal: true

FactoryBot.define do
  factory :ingredient do
    amount { Faker::Food.measurement }
    product
  end
end
