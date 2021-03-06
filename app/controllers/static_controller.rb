class StaticController < ApplicationController
	respond_to :html, :json
	

	def home
		if user_signed_in?
			@assets = current_user.assets.where('parent_id is NULL').order('uploaded_file_file_name desc') if user_signed_in?
			@folders = current_user.folders.roots.order('name desc')

			title 'Home'
		end
	end

	def browse
		@parent_folder = current_user.folders.find(params[:id])
		@child_folders = @parent_folder.children

		@folders = @parent_folder.children#folders.order('uploaded_file_file_name desc')
		@assets = @parent_folder.assets.order('uploaded_file_file_name desc')

		render action: 'home'
		
		rescue ActiveRecord::RecordNotFound
			redirect_to root_url, error: 'Don\'t be cheeky! Mind your own folder!', status: 404
	end

	def share
		foo = 'lalio'

		respond_to do |format|
			format.html { render 'new' }
      		format.json { render json: @arse }
      	end

	end
end
