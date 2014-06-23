class Asset < ActiveRecord::Base
	belongs_to :user

	has_attached_file :uploaded_file
  	validates_attachment_size :uploaded_file, less_than: 10.megabytes
	validates_attachment_content_type :uploaded_file, :content_type => ["image/jpg", "image/jpeg", "image/png", "image/gif"]

	alias_attribute :file_name, :uploaded_file_file_name

end
