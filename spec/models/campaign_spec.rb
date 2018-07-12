require 'rails_helper'

RSpec.describe Campaign, type: :model do
  let(:user) { FactoryBot.create(:user, :expert) }
  let(:campaign) { FactoryBot.create(:campaign, creator: user) }

  it "is valid with valid attributes" do
    expect(campaign).to be_valid
  end

  it "is not valid without a title" do
    campaign.title = nil
    expect(campaign).to be_invalid
  end

  it "is valid without a tag" do
    campaign.tags = nil
    expect(campaign).to be_valid
  end

  it "is not valid without a duration" do
    campaign.duration = nil
    expect(campaign).to be_invalid
  end
end
