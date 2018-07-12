FactoryBot.define do
  factory :comment do
    title { Faker::RickAndMorty.quote }
    commentor { FactoryBot.create(:user) }

    factory :campaign_comment do
      commentable { FactoryBot.create(:campaign) }
    end

    factory :todo_comment do
      commentable { FactoryBot.create(:todo) }
    end
  end
end
