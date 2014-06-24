class StaticController < ApplicationController
	def home
		@assets = current_user.assets.order('uploaded_file_file_name desc') if user_signed_in?
		@folders = current_user.folders.order('name desc')
		title 'Home'
	end
end
