module SessionHelpers
	def user_entry
		actual['warden.user.user.key']
	end

	def user_id
		user_entry[0][0]
	end

	def user_key
		user_entry[1]
	end

	def flash_entry
		session['flash']
	end

	def flash_discard
		flash_entry['discard']
	end

	def flash_flashes
		flash_entry['flashes']
	end

	def first_flash
		flash_entry['flashes'].first
	end
end

RSpec::Matchers.define :set_session_key do |key|
	match do |actual|		
		@actual = actual[key]
		@actual == @expected
	end

	failure_message do |actual|
	    "set the '#{key}' entry's value to '#{@expected}'. Instead its value is '#{@actual}'"
	end

	failure_message_when_negated do |actual|
	    "not set the '#{key}' entry's value to '#{@expected}'. Its value is '#{@actual}'"
	end

	description do
 		"set the '#{key}' entry's value to '#{@expected}'"
 	end

	def to(expected)
		@expected = expected
		self
	end

end

RSpec::Matchers.define :have_user_id_of do |expected|	
	include SessionHelpers

	match do |actual|		
		@expected = expected
		@actual = user_id

		@actual == @expected
	end

	failure_message do |actual|
	    "have an id of '#{@expected}'. Instead it had an id of '#{@actual}'"
	end

	failure_message_when_negated do |actual|
	    "not have an id of '#{@expected}'. It did have an id of '#{@actual}'"
	end

	description do
	    "have an id of '#{@expected}'"
	end
end

RSpec::Matchers.define :set_session do |key|	
	match do |actual|		

	end

	failure_message do |actual|
	end

	failure_message_when_negated do |actual|
	end

	description do
	end

	def to(expected)
		@expected = expected
		self
	end
end

RSpec::Matchers.define :set_status_code do |expected|	
	match do |actual|
		@actual = actual.status
		@expected = expected

		@actual == @expected 
	end

	failure_message do |actual|
	    "have http status code of '#{@expected}', but was '#{@actual}'"
	end

	failure_message_when_negated do |actual|
	    "not have http status code of '#{@expected}', but was '#{@actual}'"
	end

	description do
	    "have http status code of '#{@expected}'"
	end
end

RSpec::Matchers.define :redirect_to_location do |expected|	
	match do |actual|
		@actual = actual.location.gsub('http://test.host', '')
		
		expected == @actual
	end

	failure_message do |actual|
	    "redirect to #{expected}, instead redirected to #{@actual}"
	end

	failure_message_when_negated do |actual|
	    "not redirect to #{expected}, but did redirect to #{@actual}"
	end

	description do
	    "redirect to #{expected}"
	end
end

RSpec::Matchers.define :set_flash_type_to do |type|	
	match do |actual|
		@actual = actual.request  
		@actual.flash[type] != nil
	end

	failure_message do |actual|
	    "contain the key, ':#{expected}', but doesn't. Instead it contains: #{existing_keys}"
	end

	failure_message_when_negated do |actual|
	    "not contain the key, ':#{expected}', but it does: #{existing_keys}"
	end

	description do
	    "set the flash key as ':#{expected}'"
	end

	private

		def existing_keys
			@actual.flash.keys.map { |value| "':#{value}'"}.to_sentence
		end
end

RSpec::Matchers.define :set_flash_message_to do |expected|	
	match do |actual|
		key, @actual = actual.request.flash.first
		expected == @actual
	end

	failure_message do |actual|
	    "set the message to '#{expected}', but instead it was set to: '#{@actual}'"
	end

	failure_message_when_negated do |actual|
	    "not set the message to '#{expected}', but it was set to: '#{@actual}'"
	end

	description do
	    "set the message to '#{expected}'"
	end
end

RSpec::Matchers.define :set_the_instance_variable do |instance|	
	match do |actual|
		@actual = controller.instance_variable_get(instance)
		@actual == @expected
	end

	failure_message do |actual|
	    "set '#{@actual}' equal to #{@expected}. However, it did not: \n '#{@actual.inspect}' \n '#{@expected.inspect}'"
	end

	failure_message_when_negated do |actual|
	    "set '#{@actual}' not equal to #{@expected}. However, it did: \n '#{@actual.inspect}' \n '#{@expected.inspect}'"
	end

	description do
	    "set the instance '#{@actual}' to equal '#{expected}'"
	end

	def to(expected)
		@expected = expected
		self
	end
end

RSpec::Matchers.define :respond_with_type do |expected|	
	match do |actual|
		@actual = actual.content_type
		expected == @actual
	end

	failure_message do |actual|
	    "respond with '#{expected}'. Responded with #{@actual}."
	end

	failure_message_when_negated do |actual|
	    "not respond with '#{expected}'. Did respond with '#{@actual}'"
	end

	description do
	    "respond with '#{expected}'"
	end

end