# frozen_string_literal: true

feature 'destroy' do
  let(:user) { FactoryBot.create(:user) }
  let(:todo) { FactoryBot.create(:todo) }

  scenario 'expert should be able to destroy campaigns' do
    skip 'no way to destroy from ui'
    sign_in user
    visit campaign_todos_path(todo.campaign)

    expect { click_link 'Destroy' }.to change(Todo, :count).by(-1)
  end
end
