require 'rails_helper'

describe 'Asset requests pages' do
  it 'responds with redirect for asset that doesnt exist' do
    get '/assets/get/2590209230923092039092322309230923093'

    expect(response).to render_template(:home)
  end  
end