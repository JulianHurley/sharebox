require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe StaticController, :type => :controller do
  
  describe '#share' do
    let(:request) { post :share }

    describe 'response' do
      before { request }
      subject { response }

      it { should set_the_local_variable(:arse).to 'jimmies' }

    end

    describe 'session' do
=begin
      pending

      before { request }
      subject { session }

      it { should set_session_key(:foo).to('baz') }
      it { should have_user_id_of 1 }
=end
    end

    describe 'database' do
=begin
      pending

      it 'should make database queries' do
        expect { request }.to make_database_queries(count: 5)
      end

      it 'should change the name' do
        expect { request }.to change{parent_folder.reload.name}.from(parent_folder.name).to(new_name)
      end
=end
    end
  end
=begin
  let!(:user) { FactoryGirl.create(:user) }  
  let!(:parent_folder) { FactoryGirl.create(:folder, user_id: user.id) }
  let!(:child_folder) { FactoryGirl.create(:folder, user_id: user.id, parent_id: parent_folder.id) }
  let!(:orphan_folder) { FactoryGirl.create(:folder, user_id: user.id, parent_id: nil) }

  before do
    sign_in user
  end

  subject { response }

  describe '#destroy' do
    it 'deletes an orphaned folder' do
        expect{ delete :destroy, id: orphan_folder.id }.to change(Folder, :count).by(-1)
    end

    it 'deletes a child folder' do
        expect{ delete :destroy, id: child_folder.id }.to change(Folder, :count).by(-1)
    end

    context 'when orphan' do
      before do
        delete :destroy, id: orphan_folder.id
      end

      it { should have_http_status 302 }
      it { should redirect_to_location '/' }
      it { should set_flash_type_to :notice }
      it { should set_flash_message_to 'successfully delted the folder' }
    end

    context 'when child' do

      before do
        delete :destroy, id: child_folder.id
      end

      it { should have_http_status 302 }
      it { should redirect_to_location "/browse/#{parent_folder.id}" }
      it { should set_flash_type_to :notice }
      it { should set_flash_message_to 'successfully delted the folder' }
    end
  end
=end
end

