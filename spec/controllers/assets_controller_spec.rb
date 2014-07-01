require 'rails_helper'

RSpec.describe AssetsController, type: :controller do
  subject { response }

  let!(:user) { FactoryGirl.create(:user) }  
  let!(:user_2) { FactoryGirl.create(:user) }  
  let!(:asset) { FactoryGirl.create(:asset, user_id: user.id) }
  let!(:other_persons_asset) { FactoryGirl.create(:asset, user_id: user_2.id)}
  let!(:file) { fixture_file_upload('files/eve.jpg', 'image/jpeg') }
  let!(:folder) { FactoryGirl.create(:folder, user_id: user.id, parent_id: nil) }


  before do
    sign_in user
  end

  describe '#get' do
    context 'when exists' do
      before do
        controller.should_receive(:send_file).with("#{Rails.root}/private/1/#{asset.file_name.gsub('.png','')}", type: "#{asset.uploaded_file_content_type}")
        controller.stub(:render)

        get :get, id: asset.id
      end

      it { should have_http_status 200 }
    end

    context 'when doesn\'t exist' do
      before do
        get :get, id: Asset.count + 1      
      end


      

      it { should redirect_to_location '/assets'}
      it { should set_flash_type_to :error }
      it { should set_flash_message_to 'missing file' }
    end

    context 'when exists but belongs to someone else' do
      before do
        controller.should_not_receive(:send_file)
 
        get :get, id: other_persons_asset.id
      end

      it { should redirect_to_location '/assets'}
      it { should set_flash_type_to :error }
      it { should set_flash_message_to 'missing file' }
    end
  end
  describe '#create' do
    context 'when orphan' do
      before do
        post :create, asset: { parent_id: nil, uploaded_file: file }
      end

      it { should have_http_status 302 }
      it { should redirect_to_location '/' }
  
      it 'create a asset' do
        expect { post :create, asset: { parent_id: nil, uploaded_file: file } }.to change(Asset, :count).by(1)
      end

    end

    context 'when in folder' do
      before do
        post :create, asset: { parent_id: folder.id, uploaded_file: file }
      end

      it { should have_http_status 302 }
      it { should redirect_to_location "/browse/#{folder.id}" }
      it { should set_flash_type_to :notice }
      it { should set_flash_message_to 'successfully uploaded file!' }

      it 'create a asset' do
        expect { post :create, asset: { parent_id: nil, uploaded_file: file } }.to change(Asset, :count).by(1)
      end
    end
  end
end
