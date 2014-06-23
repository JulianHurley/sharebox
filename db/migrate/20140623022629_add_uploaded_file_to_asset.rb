class AddUploadedFileToAsset < ActiveRecord::Migration
  def change
  	add_attachment :assets, :uploaded_file
  end
end
