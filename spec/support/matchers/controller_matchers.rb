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