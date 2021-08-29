# frozen_string_literal: true

FactoryBot.define do
  factory :note

  trait :with_some_attributes do
    title { Faker::Lorem.sentence }
    description { [Faker::Lorem.paragraph, nil].sample }
    started_at { [Faker::Time.backward(days: 10), nil].sample }
    completed_at { [Time.current, nil].sample }
  end
end
