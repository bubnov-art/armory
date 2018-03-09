require "rails_helper"

feature 'home page' do
  scenario 'visit page' do
    visit '/'
    expect(page).to have_content('Please, login')
  end
end