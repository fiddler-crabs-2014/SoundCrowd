require 'spec_helper'

describe "Playlists", :js => true do
  let!(:playlist){ create :playlist }

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
        visit new_playlist_path(playlist)
        fill_in "Name", :with => ""
        click_on "Create Playlist"
        visit playlists_path
        expect(page).to_not have_content playlist.name
      end
    end
  end

end
