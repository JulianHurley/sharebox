require 'rails_helper'

feature 'User signup', js: true, type: :feature do

	def sign_in
		visit '/users/sign_up'
		fill_in 'user_name', with: 'name'
		fill_in 'user_email', with: 'myemail@email.com'
		fill_in 'user_password', with: 'passpass'
		fill_in 'user_password_confirmation', with: 'passpass'
		click_button 'Sign up'
	end

	it 'user signs up' do
		sign_in

		expect(page).to have_text('Home')
		expect(page).to have_text('Welcome! You have signed up successfully.')
		expect(page).to have_text('name')
	end

	it 'user can sign out' do
		sign_in
		click_link 'sign out'

		expect(page).to have_text('Signed out successfully.')
	end
end