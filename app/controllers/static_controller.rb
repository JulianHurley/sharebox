class StaticController < ApplicationController
	def home
		@assets = current_user.assets.order('uploaded_file_file_name desc') if user_signed_in?

		title 'Home'
	end
end
