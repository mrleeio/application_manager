# frozen_string_literal: true

FactoryBot.define do
  factory :client do
    name { Faker::Company.name }

    traits_for_enum :business_type, %w[private_equity real_estate]
  end
end
