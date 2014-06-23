class AssetsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_asset, only: [:show, :edit, :update, :destroy]
	
	def new
		@asset = current_user.assets.new

		title 'Upload new asset'
	end
	def create 
		current_user.assets.create(asset_params)
		flash.now[:notice] = 'successfully uploaded file!'
		
		render 'static/home'
	end

	def index
		@assets = current_user.assets

		title 'All assets'
	end

	def show
	end

	def edit
	end
	def update
	end

	def destroy
		@asset.destroy
	end

	private
		def set_asset
			@asset = current_user.assets.find(params[:id])
		end

		def asset_params
			params.require(:asset).permit(:uploaded_file)
		end
end
