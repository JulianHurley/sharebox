class Folder < ActiveRecord::Base		
	include Filesystem
	
	acts_as_tree
	
	belongs_to :user
	has_many :assets, foreign_key: :parent_id, dependent: :destroy
end
