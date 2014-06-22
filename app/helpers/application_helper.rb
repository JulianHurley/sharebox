module ApplicationHelper

	def display_flashes
		render partial: 'layouts/flash', object: flash
	end

end
