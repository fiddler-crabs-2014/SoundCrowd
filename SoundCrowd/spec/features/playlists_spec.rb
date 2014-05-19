require 'spec_helper'

describe "Playlists", :js => false do
  let(:user) { create :user }
  let(:playlist){ create :playlist }
  let!(:playlists) { [playlist, create(:playlist)] }

  before do
    visit signin_path
    fill_in "Email", with: user.email
    fill_in "Password", with: user.password
    click_button "Sign In"
  end

  describe "User can create a playlist" do

    context "with a valid name" do
      it "will be appended to the playlist index page" do

        visit new_user_playlist_path user.id
        fill_in "Name", :with => playlist.name
        click_on "Create Playlist"
        expect(page).to have_content playlist.name
      end
    end
  end

  describe "User cannot create a playlist" do
    context "with an invalid name" do
      it "will not be appended to the playlist index page" do
        visit new_user_playlist_path user.id
        fill_in "Name", with: ""
        click_on "Create Playlist"

        expect(page).to have_content "Name can't be blank"
      end
    end
  end

  describe "User can view all playlists" do
    it "can see a list of all playlists that have been created" do
      visit user_playlists_path user.id
      playlists.each do |playlist|
        expect(page).to have_content playlist.name
      end
    end
  end

  describe "User can view a playlist" do
    it "can navigate to the correct playlist from the playlists page" do
      visit user_playlists_path user.id
      click_on playlist.name
      expect(current_path).to eq user_playlist_path user.id, playlist.id
      expect(page).to have_content playlist.name
      expect(page).to_not have_content playlists.last.name
    end
  end

  describe "User can edit a playlist" do
    # before do let(:user) { create :user } }
    # let(:playlist){ create :playlist }
    it "can navigate to the edit page from the current path" do
      visit user_playlist_path playlist.user, playlist
      click_on "Edit"
      expect(current_path).to eq edit_user_playlist_path playlist.user, playlist.id
      expect(page).to have_content playlist.name
    end

    it "can succesfully edit a playlist title" do
      visit edit_user_playlist_path(playlist.user, playlist)
      fill_in "Name", with: "Fun Timezzzzz"
      click_on "Change Playlist"
      expect(current_path).to eq user_playlists_path user.id
      expect(page).to have_content "Fun Timezzzzz"
    end
  end



end
