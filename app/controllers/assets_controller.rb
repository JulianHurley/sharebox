class AssetsController < ApplicationController
	before_filter :authenticate_user!

	def new
		@asset = current_user.assets.new
	end
	def create 
		if asset = current_user.assets.create(asset_params)
			flash.now[:notice] = 'successfully uploaded file!'
			render 'static/home'
		else
			redirect_to assets_new_url, alert: 'file could not be uploaded', status: 304
		end
	end

	def index
		p "YES YES"
		@assets = current_user.assets
	end

	def show
		@asset = current_user.assets.find(asset_params)
	end

	def edit
		@asset = current_user.assets.find(asset_params)
	end
	def update
		@asset = current_user.assets.find(asset_params)
	end

	def destroy
		asset = current_user.assets.find(asset_params)
		asset.destroy
	end

	private
		def asset_params
			pp params
			params.require(:assets).permit(:asset)
		end
end
