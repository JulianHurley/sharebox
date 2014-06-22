require 'rails_helper'

describe 'user page' do

  describe 'registration' do
    it 'responds with sign up page' do
      get '/users/sign_up'

      expect(response).to render_template('devise/registrations/new')
    end

    it 'responds with sign in page' do
      get '/users/sign_in'

      expect(response).to render_template('devise/sessions/new')
    end

  end

end