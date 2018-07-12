# frozen_string_literal: true

feature 'index' do
  let(:novice) { FactoryBot.create(:user) }
  let(:expert) { FactoryBot.create(:user, :expert) }

  before :each do
    @campaign = FactoryBot.create(:campaign, creator: expert)
    @other_campaign = FactoryBot.create(:campaign)
  end

  scenario 'novice should see all campaigns' do
    sign_in novice
    visit campaigns_path

    expect(page).to have_content(@other_campaign.title)
    expect(page).to have_content(@campaign.title)
  end

  scenario 'expert should see all campaigns' do
    sign_in expert
    visit campaigns_path

    expect(page).to have_content(@other_campaign.title)
    expect(page).to have_content(@campaign.title)
  end
end
