require 'rails_helper'

RSpec.describe AssetsController, type: :controller do

  subject { response }
=begin
  let(:file) { ActionDispatch::Http::UploadedFile.new({
    :filename => 'eve.jpg',
    :type => 'image/jpeg',
    :tempfile => File.new("#{Rails.root}/spec/fixtures/files/eve.jpg")
  }) }  
=end
  let(:file) { fixture_file_upload('files/eve.jpg', 'image/jpeg') }
  let(:folder) { FactoryGirl.create(:folder) }
  let(:user) { FactoryGirl.create(:user) }

  before do
    sign_in user
  end

  describe '#create' do
    context 'when orphan' do
      before do
        post :create, asset: { parent_id: nil, uploaded_file: file }
      end

      it { should have_http_status 302 }
      it { should redirect_to '/' }
    end

    context 'when in folder' do
      before do
        post :create, asset: { parent_id: folder.id, uploaded_file: file }
      end

      it { should have_http_status 302 }
      it { should redirect_to "/browse/#{folder.id}" }
    end
  end
end
