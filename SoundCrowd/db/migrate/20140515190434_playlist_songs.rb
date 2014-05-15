class PlaylistSongs < ActiveRecord::Migration
  def change
  	create_table :playlist_songs do |t|
      t.references :playlist
      t.references :song
      t.timestamps
  	end
  end
end
