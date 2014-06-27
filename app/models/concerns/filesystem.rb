module Filesystem
	extend ActiveSupport::Concern

	included do
		scope :no_parents, -> { where(parent_id: nil)}

		def parent?
			self.parent_id ? true : false
		end

		def pwd(a={})
			o = {
				and_self: true
			}.merge!(a)

			# all ancestors and itself
			path = self.ancestors.reverse.map(&:name)
			path << name if (o[:and_self])
		end
	end
end