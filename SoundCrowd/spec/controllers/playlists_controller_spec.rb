require 'spec_helper'
require 'pry-debugger'
require 'pry'
describe PlaylistsController do
  let(:playlist) { create :playlist }
  let(:user) { create :user }

  before { session[:user_id] = user.id }
  describe "#index" do
    it "is successful" do
      get :index, user_id: user.id
      expect(response).to be_success
    end
  end

  context "#new" do
    # before { session[:user_id] = user.id }
    it "is successful" do
      get :new, user_id: user.id
      expect(response).to be_success
    end
  end

  context "#create" do
    context "with valid attributes" do
      it "saves to the database" do
        expect {
          post :create, :playlist => FactoryGirl.attributes_for(:playlist), user_id: user.id
        }.to change { Playlist.count }.by(1)
      end

      it "responds with a redirect" do
        post :create, :playlist => FactoryGirl.attributes_for(:playlist), user_id: user.id
        expect(response).to be_redirect
      end
    end
    context "with invalid attributes" do
      it "should not save to the database" do
        expect {
          post :create, :playlist => {name: ""}, user_id: user.id
        }.to_not change {Playlist.count}
      end
    end
  end

  context "#show" do
    it "shows the correct playlist" do
      get :show, :id => playlist.id, user_id: user.id
      expect(assigns(:playlist)).to eq playlist
    end

  end
end
