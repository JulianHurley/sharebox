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

end