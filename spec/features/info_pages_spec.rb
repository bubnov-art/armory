require "rails_helper"

feature 'about pages' do
  scenario 'visit page' do
  	visit '/'
  	click_link 'About'
    expect(page).to have_selector('h3', text: 'About')
  end
end

feature 'faq page' do
  scenario 'visit page' do
  	visit '/'
  	click_link 'FAQ'
    expect(page).to have_selector 'h3', text: 'FAQ'
  end
end

feature 'login page' do
  scenario 'visit page' do
    visit '/'
    click_link 'Login'
    expect(page).to have_selector( 'legend', text: 'Login')
  end
end