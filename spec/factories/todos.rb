# frozen_string_literal: true

FactoryBot.define do
  factory :todo do
    title { "Read the `#{FFaker::Book.title}`" }

    trait :completed do
      completed { true }
    end

    trait :uncompleted do
      completed { false }
    end
  end
end
