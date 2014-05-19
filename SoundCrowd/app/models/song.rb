class Song < ActiveRecord::Base
  belongs_to :playlist
  # validates :title, :presence => true
  # validates :artist, :presence => true



end
