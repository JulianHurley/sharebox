RSpec::Matchers.define :redirect_to_location do |expected|	
	match do |actual|
		@actual = actual.location.gsub('http://test.host', '')
		
		expected == @actual
	end

	failure_message_for_should do |actual|
	    "should redirect to #{expected}, instead redirected to #{@actual}"
	end

	failure_message_for_should_not do |actual|
	    "should not redirect to #{expected}, but did redirect to #{@actual}"
	end

	description do
	    "should redirect to #{expected}"
	end
end

RSpec::Matchers.define :set_flash_type_to do |type|	
	match do |actual|
		@actual = actual.request  
		@actual.flash[type] != nil
	end

	def existing_keys
		@actual.flash.keys.map { |value| "':#{value}'"}.to_sentence
	end

	failure_message_for_should do |actual|
	    "should contain the key, ':#{expected}', but doesn't. Instead it contains: #{existing_keys}"
	end

	failure_message_for_should_not do |actual|
	    "should not contain the key, ':#{expected}', but it does: #{existing_keys}"
	end

	description do
	    "should set the flash key as ':#{expected}'"
	end
end

RSpec::Matchers.define :set_flash_message_to do |expected|	
	match do |actual|
		key, @actual = actual.request.flash.first
		expected == @actual
	end

	failure_message_for_should do |actual|
	    "should set the message to '#{expected}', but instead it was set to: '#{@actual}'"
	end

	failure_message_for_should_not do |actual|
	    "should not set the message to '#{expected}', but it was set to: '#{@actual}'"
	end

	description do
	    "should set the message to '#{expected}'"
	end
end

RSpec::Matchers.define :set_the_instance_variable do |instance|	
	match do |actual|
		@actual = controller.instance_variable_get(instance)
		@actual == @value
	end

	failure_message_for_should do |actual|
	    "Expected '#{instance}' to equal #{@value}. However, it did not: \n '#{@actual.inspect}' \n '#{@value.inspect}'"
	end

	failure_message_for_should_not do |actual|
	    "should not set the message to '#{expected}', but it was set to: '#{@actual}'"
	end

	description do
	    "should set the message to '#{expected}'"
	end

	
		def to(value)
			@value = value
			self
		end
end

RSpec::Matchers.define :respond_with_type do |expected|	
	match do |actual|
		@actual = actual.content_type
		expected == @actual
	end

	failure_message_for_should do |actual|
	    "Should respond with '#{expected}'. Responded with #{@actual}."
	end

	failure_message_for_should_not do |actual|
	    "Should not respond with '#{expected}'. Did respond with '#{@actual}'"
	end

	description do
	    "Should respond with '#{expected}'"
	end

	
		def to(value)
			@value = value
			self
		end
end