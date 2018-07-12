# frozen_string_literal: true

feature 'new' do
  let(:novice) { FactoryBot.create(:user) }
  let(:expert) { FactoryBot.create(:user, :expert) }

  scenario 'novice should not be able to create campaigns' do
    sign_in novice
    visit new_campaign_path

    expect(page).to have_content('You cannot access this page.')
  end

  scenario 'expert should be able to create campaigns' do
    sign_in expert
    visit new_campaign_path

    fill_in :campaign_title, with: 'Home Campaign'
    fill_in :campaign_tags, with: 'Home,Campaign,tags'
    fill_in :campaign_duration, with: 100

    expect { click_button 'Create Campaign' }.to change(Campaign, :count).by(1)
  end
end
