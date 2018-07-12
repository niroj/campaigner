# frozen_string_literal: true

feature 'new' do
  let(:user) { FactoryBot.create(:user) }
  let(:campaign) { FactoryBot.create(:campaign) }

  scenario 'expert should be able to create campaigns' do
    sign_in user
    visit campaign_path(campaign)

    fill_in :todo_title, with: 'Home Campaign title'

    expect { click_button 'Create Todo' }.to change(campaign.todos, :count).by(1)
  end
end
