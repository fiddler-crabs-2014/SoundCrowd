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

    # add tests
    it "sets user variable" do
      get :index, user_id: user.id
      controller.assigns(:user).to eq user # controller assigns @user to the user's whose id was in params
    end

    xit "sets playlists variable"

    context "when user_id is not sent" do
      xit "errors or whatever" #maybe don't need cuz nested route?
    end
  end

  describe "#new" do
    # before { session[:user_id] = user.id }
    it "is successful" do
      get :new, user_id: user.id
      expect(response).to be_success
    end

    #add
    xit "sets playlists variable"
  end

  describe "#create" do
    context "when valid attributes are passed" do
      it "saves to the database" do
        expect {
          # don't use FactoryGirl.attributes_for b/c only using certain
          # attributes, i.e. name
          # post :create, :playlist => { name: "My awesome playlist" }, user_id: user.id
          post :create, :playlist => FactoryGirl.attributes_for(:playlist), user_id: user.id
        }.to change { Playlist.count }.by(1)
      end

      xit "creates playlist with correct values"  # optional

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

      xit "renders new template"
      xit "sets notice"
    end
  end

  describe "#show" do
    before do
      # stub or use factory sound cloud
      # you never want unit tests to hit an api
      # gems: fakeweb, puffing billy, vcr
    end

    it "shows the correct playlist" do
      get :show, :id => playlist.id, user_id: user.id
      expect(assigns(:playlist)).to eq playlist
    end

    xit "assigns client, playlist, songs"

  end

  describe "#edit"
  describe "#update"
  describe "#destroy"
end
