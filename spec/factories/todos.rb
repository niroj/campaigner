FactoryBot.define do
  factory :todo do
    title { Faker::RickAndMorty.quote }
    creator { FactoryBot.create(:user) }
    campaign { FactoryBot.create(:campaign) }

    trait :completed do
      completed false
      completed_by { FactoryBot.create(:user) }
    end
  end
end
