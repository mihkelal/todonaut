# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    username { Faker::Internet.unique.username }
    password { Faker::Internet.password }
    password_digest { BCrypt::Password.create(password) }
  end
end
