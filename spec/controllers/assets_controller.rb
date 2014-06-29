require 'rails_helper'

RSpec.describe AssetsController, type: :controller do

  subject { response }

  let(:file) { fixture_file_upload('files/eve.jpg', 'image/jpeg') }
  let(:folder) { FactoryGirl.create(:folder) }
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in user
  end

  describe '.create' do
    context 'when orphan' do
      before do
        post :create, asset: { parent_id: nil, uploaded_file: file }
      end

      it { should have_http_status 201 }
      it { should redirect_to_location '/' }
    end

    context 'when in folder' do
      before do
        post :create, asset: { parent_id: folder.id, uploaded_file: file }
      end

      it { should have_http_status 201 }
      it { should redirect_to_location "/browse/#{folder.id}" }

    end
  end

  describe '.destroy' do
    
  end
end
