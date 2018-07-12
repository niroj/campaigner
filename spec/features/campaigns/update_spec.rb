# frozen_string_literal: true

feature 'edit' do
  let(:novice) { FactoryBot.create(:user) }
  let(:expert) { FactoryBot.create(:user, :expert) }

  before :each do
    @campaign = FactoryBot.create(:campaign, creator: expert)
  end

  scenario 'novice should not be able to edit campaigns' do
    sign_in novice
    visit edit_campaign_path(@campaign)

    expect(page).to have_content('You cannot access this page.')
  end

  scenario 'expert should be able to edit campaigns' do
    sign_in expert
    visit edit_campaign_path(@campaign)

    expect(page).to have_content(@campaign.title)

    fill_in :campaign_title, with: 'Home Campaign'
    fill_in :campaign_tags, with: 'Home,Campaign,tags'
    fill_in :campaign_duration, with: 100

    click_button 'Update Campaign'

    expect(page).to have_content('Home Campaign')
  end
end
