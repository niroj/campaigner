# frozen_string_literal: true

feature 'destroy' do
  let(:novice) { FactoryBot.create(:user) }
  let(:expert) { FactoryBot.create(:user, :expert) }

  before :each do
    @campaign = FactoryBot.create(:campaign, creator: expert)
  end

  scenario 'novice should not be able to destroy campaigns' do
    sign_in novice
    visit campaigns_path

    click_link 'Destroy'

    expect(page).to have_content('You cannot access this page.')
  end

  scenario 'expert should be able to destroy campaigns' do
    sign_in expert
    visit campaigns_path

    expect { click_link 'Destroy' }.to change(Campaign, :count).by(-1)
  end
end
