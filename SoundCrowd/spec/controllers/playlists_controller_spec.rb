require 'spec_helper'
require 'pry-debugger'
require 'pry'
describe PlaylistsController do
  let(:playlist) { create :playlist }
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
    context "with valid attributes" do
      it "saves to the database" do
        expect {
          post :create, :playlist => FactoryGirl.attributes_for(:playlist)
        }.to change { Playlist.count }.by(1)
      end

      it "responds with success" do
        expect(response).to be_success
      end
    end
    context "with invalid attributes" do
      it "should not save to the database" do
        expect {
          post :create, :playlist => {name: ""}
        }.to_not change {Playlist.count}
      end
    end  
  end

  context "#show" do
    it "shows the correct playlist" do
      get :show, :id => playlist.id
      expect(assigns(:playlist)).to eq playlist
    end

  end
end
