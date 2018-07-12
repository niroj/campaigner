require 'rails_helper'

RSpec.describe Todo, type: :model do
  let(:user) { FactoryBot.create(:user, :expert) }
  let(:campaign) { FactoryBot.create(:campaign, creator: user) }
  let(:todo) { FactoryBot.create(:todo, creator: user, campaign: campaign) }

  it "is valid with valid attributes" do
    expect(todo).to be_valid
  end

  it "is not valid without title" do
    todo.title = nil
    expect(todo).to be_invalid
  end
end
