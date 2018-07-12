# frozen_string_literal: true

FactoryBot.define do
  factory :user do
    sequence :email do |n|
      "person#{n}@campaigner.com"
    end
    password 'please123'

    trait :expert do
      role 'expert'
    end

    trait :novice do
      role 'novice'
    end
  end
end
