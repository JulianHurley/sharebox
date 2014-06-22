require 'rails_helper'

describe 'devise/registrations/new', js: true, type: :view do


    it 'has a name field' do
	  pending

      user_stub = stub_model(User)
	  expect(view).to receive(:resource).and_return(user_stub)
#	  expect(user_stub).to receive(:method_remove).and_return(true)
      #assign(:resouce, build_stubbed(User.new))
      render
      rendered.should contain('Email')
    end

end