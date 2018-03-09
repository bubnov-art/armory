require "rails_helper"
require_relative '../support/login_form'
feature 'login as a user' do
	let(:login_form) { LoginForm.new }
	let(:first_user) { FactoryBot.create(:user, email: "first-user@mail.com", username: 'first') }
	let(:second_user) { FactoryBot.create(:user, email: "second-user@mail.com", username: 'second') }
  
  scenario 'with valid data' do
    login_form.visit_page.fill_in_with.submit
    expect(page).to have_content("Welcome! You have signed up successfully.")
  end

  scenario 'with blank data' do
    login_form.visit_page.submit
    expect(page).to have_content("can't be blank")
  end

  scenario 'with not uniq data' do
    login_form.visit_page.register_as(first_user)
    expect(page).to have_content('Email has already been taken')
  end
end