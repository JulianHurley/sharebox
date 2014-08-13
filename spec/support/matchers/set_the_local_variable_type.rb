RSpec::Matchers.define :set_the_local_variable do |variable|	
	match do |actual|
#		ap binding.local_variable_get(variable)
		
#		controller.define_singleton_method(:variable_get) do
#			binding.local_variable_get(variable)
#		end

#		ap controller.send(:binding).local_variable_get('foo')
		
		ap controller.send(:binding).send(:local_variables)

#		@expected = controller.send(:local_variables)

		@actual = '22'
		

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