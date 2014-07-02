require 'rails_helper'

feature 'User signup', js: true, type: :feature do



	it 'user signs up' do
		sign_up

		expect(page).to have_text('ShareBox')
		expect(page).to have_text('Welcome! You have signed up successfully.')
		expect(page).to have_text('name')
	end

	it 'user can sign out' do
		sign_up
		click_link 'Sign out'

		expect(page).to have_text('Signed out successfully.')
	end

	it 'user can sign in' do
		sign_up
		click_link 'Sign out'
		visit '/users/sign_in'
		fill_in 'user_email', with: 'myemail@email.com'
		fill_in 'user_password', with: 'passpass'
		click_button 'Sign in'
		
		expect(page).to have_text('Signed in successfully.')
	end
end