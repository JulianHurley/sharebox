class Folder < ActiveRecord::Base		
	include Filesystem
	
	acts_as_tree
	
	belongs_to :user

#	has_many_and_belongs_to :folders, foreign_key: :parent_id
	has_many :assets, foreign_key: :parent_id, dependent: :destroy
	has_many :shared_folders, dependent: :destroy
end
