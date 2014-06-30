class AssetsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_asset, only: [:get, :show, :edit, :update, :destroy]
	
	def new
		@asset = current_user.assets.new

		if params[:parent_id] # if weve arrived here via the new_sub_folder path. This action is in charge of creating orphan folders AND sub folders
	    	@parent_folder = current_user.folders.find(params[:parent_id])
			@asset.parent_id = @parent_folder.id
	    end

		title 'Upload new asset'
	end
	def create
		asset = current_user.assets.create(asset_params)

		if asset.parent?
			redirect_to browse_path(asset.parent_id), notice: "successfully uploaded file!", status: 201
#			redirect_to root_url, notice: 'successfully uploaded file!'
		else 
			redirect_to root_url, notice: 'successfully uploaded file!', status: 201
		end
	end

	def index
		@assets = current_user.assets

		title 'All assets'
	end

	def show
	end
	def get
		send_file @asset.uploaded_file.path, type: @asset.uploaded_file_content_type

		rescue ActionController::MissingFile
			redirect_to assets_url, notice: 'missing file'
	end

	def edit
	end
	def update
	end

	def destroy

	end

	private
		def asset_not_found

			
		end

		def set_asset
			@asset = current_user.assets.find(params[:id])
			
			rescue ActiveRecord::RecordNotFound
				flash[:notice] = "resource does not exist"
				redirect_to assets_url
		end

		def asset_params
			params.require(:asset).permit(:uploaded_file, :parent_id)
		end
end
