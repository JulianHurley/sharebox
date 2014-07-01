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