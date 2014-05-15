require 'spec_helper'
describe PlaylistsController do
  let!(:playlist) { create :playlist }
  context "#index" do
    it "is successful" do
      get :index
      expect(response).to be_success
    end
  end

  context "#new" do
    it "is successful" do
      get :new
      expect(response).to be_success
    end
  end

  context "#create" do
    it "with valid attributes" do
      expect {
        post :create, :playlist => attributes_for(playlist_params)
        expect(response).to be_success
      }.to change { Playlist.count }.by(1)
    end

    it "with invalid attributes" do
      expect {
        post :create
        expect(response.status).to eq 422
      }.to_not change {Playlist.count}
    end
  end
end
