class Playlists < ActiveRecord::Migration
  def change
  	create_table :playlists do |t|
      t.string :name
      t.references :user
      t.integer :votes
      t.timestamps
  	end
  end
end
