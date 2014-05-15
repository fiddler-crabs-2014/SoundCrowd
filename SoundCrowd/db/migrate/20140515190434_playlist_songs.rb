class PlaylistSongs < ActiveRecord::Migration
  def change
  	create_table :songs do |t|
      t.references :playlist
      t.references :song
      t.timestamps
  	end
  end
end
