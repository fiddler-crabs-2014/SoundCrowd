class Songs < ActiveRecord::Migration
  def change
  	create_table :songs do |t|
      t.string :api_name
      t.integer :api_id
      t.string :url
      t.string :title
      t.string :artist

      t.timestamps
  	end
  end
end
