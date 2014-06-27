require 'rails_helper'

RSpec.describe AssetsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Folder. As you add validations to Folder, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }


  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # FoldersController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do

    it "assigns all folders as @folders" do
      pending

      allow(Folder).to receive(:title).and_return("The RSpec Book")
      
      get :index, {}, valid_session
      expect(assigns(:folders)).to eq([folder])
    end
  end

  describe "GET show" do
    pending

    it "assigns the requested folder as @folder" do
      folder = Folder.create! valid_attributes
      get :show, {:id => folder.to_param}, valid_session
      expect(assigns(:folder)).to eq(folder)
    end
  end



  describe "GET edit" do
    pending
    it "assigns the requested folder as @folder" do
      folder = Folder.create! valid_attributes
      get :edit, {:id => folder.to_param}, valid_session
      expect(assigns(:folder)).to eq(folder)
    end
  end










  describe "GET new" do
    it "assigns a new folder as @folder" do
     
      get :new, {}, valid_session
      expect(assigns(:folder)).to be_a_new(Folder)
    end
  end
  describe "POST create" do
    describe "with valid params" do
      it "creates a new Folder" do
        expect {
          post :create, {:folder => valid_attributes}, valid_session
        }.to change(Folder, :count).by(1)
      end

      it "assigns a newly created folder as @folder" do
        post :create, {:folder => valid_attributes}, valid_session
        expect(assigns(:folder)).to be_a(Folder)
        expect(assigns(:folder)).to be_persisted
      end

      it "redirects to the created folder" do
        post :create, {:folder => valid_attributes}, valid_session
        expect(response).to redirect_to(Folder.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved folder as @folder" do
        post :create, {:folder => invalid_attributes}, valid_session
        expect(assigns(:folder)).to be_a_new(Folder)
      end

      it "re-renders the 'new' template" do
        post :create, {:folder => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end








  describe "PUT update" do
        pending

    describe "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested folder" do
        folder = Folder.create! valid_attributes
        put :update, {:id => folder.to_param, :folder => new_attributes}, valid_session
        folder.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested folder as @folder" do
        folder = Folder.create! valid_attributes
        put :update, {:id => folder.to_param, :folder => valid_attributes}, valid_session
        expect(assigns(:folder)).to eq(folder)
      end

      it "redirects to the folder" do
        folder = Folder.create! valid_attributes
        put :update, {:id => folder.to_param, :folder => valid_attributes}, valid_session
        expect(response).to redirect_to(folder)
      end
    end

    describe "with invalid params" do
      it "assigns the folder as @folder" do
        folder = Folder.create! valid_attributes
        put :update, {:id => folder.to_param, :folder => invalid_attributes}, valid_session
        expect(assigns(:folder)).to eq(folder)
      end

      it "re-renders the 'edit' template" do
    

        folder = Folder.create! valid_attributes
        put :update, {:id => folder.to_param, :folder => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do

    pending

    it "destroys the requested folder" do
      folder = Folder.create! valid_attributes
      expect {
        delete :destroy, {:id => folder.to_param}, valid_session
      }.to change(Folder, :count).by(-1)
    end

    it "redirects to the folders list" do
        pending

      folder = Folder.create! valid_attributes
      delete :destroy, {:id => folder.to_param}, valid_session
      expect(response).to redirect_to(folders_url)
    end
  end

end
