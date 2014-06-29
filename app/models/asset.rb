class Asset < ActiveRecord::Base
	include Filesystem

	belongs_to :user
	belongs_to :folder, foreign_key: :parent_id
	
	has_attached_file :uploaded_file,
					  url: 'assets/get/:id',
					  path: "#{Rails.root}/private/:id/:basename"
	# path is where the file is stored
	# url is how we access the file
  	validates_attachment_size :uploaded_file, less_than: 10.megabytes
	validates_attachment_content_type :uploaded_file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	alias_attribute :file_name, :uploaded_file_file_name

end
