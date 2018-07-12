# frozen_string_literal: true

feature 'index' do
  let(:user) { FactoryBot.create(:user) }
  let(:campaign) { FactoryBot.create(:campaign) }
  let(:other_campaign) { FactoryBot.create(:campaign) }

  before :each do
    @todo = FactoryBot.create(:todo, campaign: campaign)
    @other_todo = FactoryBot.create(:todo, campaign: other_campaign)
  end

  scenario 'user should see all Todos within given campaign' do
    sign_in user
    visit campaign_todos_path(campaign)

    expect(page).to have_content(@todo.title)
    expect(page).to_not have_content(@other_todo.title)
  end
end
