require 'rails_helper'

RSpec.describe "Folders", :type => :request do
  describe "GET /folders" do
    it "works! (now write some real specs)" do
      get folders_path
      expect(response.status).to be(200)
    end
  end
end
