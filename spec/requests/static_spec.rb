require 'rails_helper'

describe 'Static pages' do
  it 'responds with home page' do
    get '/'

    expect(response).to render_template(:home)
  end  
end