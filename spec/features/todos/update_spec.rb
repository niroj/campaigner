# frozen_string_literal: true

feature 'edit' do
  let(:user) { FactoryBot.create(:user) }
  let(:todo) { FactoryBot.create(:todo, title: 'Other title') }

  scenario 'user should be able to edit campaigns' do
    sign_in user
    visit edit_campaign_todo_path(todo.campaign, todo)

    fill_in :todo_title, with: 'Home Campaign todo'

    click_button 'Update Todo'

    expect(page).to have_content('Home Campaign todo')
  end
end
