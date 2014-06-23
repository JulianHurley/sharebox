require 'rails_helper'

feature 'Asset spec', js: true, type: :feature do

	it 'asset can be uploaded' do
		sign_up
		upload_file

		expect(page).to have_text('successfully uploaded file!')	
	end

	it 'asset index displays all assets' do
		pending

		sign_up
		upload_file
		click_link 'My Assets'

	end

	it 'returns a file not found if the file is missing' do
		sign_up
	end

	it 'returns a flash if you attempt to a view a file you don\'t own' do
	
	end

end