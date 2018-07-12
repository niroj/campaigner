FactoryBot.define do
  factory :campaign do
    title { Faker::RickAndMorty.quote }
    tags { Faker::Lorem.words(4).join(',') }
    duration { rand(1..1000) }
    creator { FactoryBot.create(:user) }
  end
end
