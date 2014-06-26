module Filesystem
	extend ActiveSupport::Concern

	included do
		scope :no_parents, -> { where(parent_id: nil)}
	end
end