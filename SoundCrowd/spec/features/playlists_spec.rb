require 'spec_helper'

describe "Playlists", :js => true do
  let!(:playlist){ create :playlist }
  let!(:playlists) { [playlist, create(:playlist)] }

  describe "User can create a playlist" do
    context "with a valid name" do
      it "will be appended to the playlist index page" do
        visit new_playlist_path(playlist)
        fill_in "Name", :with => playlist.name
        click_on "Create Playlist"
        expect(page).to have_content playlist.name
      end
    end
  end

  describe "User cannot create a playlist" do
    context "with an invalid name" do
      it "will be appended to the playlist index page" do
        visit new_playlist_path
        fill_in "Name", :with => ""
        click_on "Create Playlist"
        visit playlists_path
        expect(page).to_not have_content playlist.name
      end
    end
  end

  describe "User can view all playlists" do
    it "can see a list of all playlists that have been created" do
      visit playlists_path
      playlists.each do |playlist|
        expect(page).to have_content playlist.name
      end
    end
  end

  describe "User can view a playlist" do
    it "can navigate to the correct playlist from the playlists page" do
      visit playlists_path
      click_on playlist.name
      expect(current_path).to eq playlist_path(playlist)
      expect(page).to have_content playlist.name
      expect(page).to_not have_content playlists.last.name
    end
  end

  describe "User can edit a playlist" do
    it "can navigate to the edit page from the current path" do
      visit playlist_path(playlist)
      click_on "Edit"
      expect(current_path).to eq edit_playlist_path(playlist)
      expect(page).to have_content playlist.name
    end

    it "can succesfully edit a playlist title" do
      visit edit_playlist_path(playlist)
      fill_in "Name", with: "Fun Timezzzzz"
      click_on "Change Playlist"
      expect(current_path).to eq playlists_path
      expect(page).to have_content "Fun Timezzzzz"
    end
  end



end
