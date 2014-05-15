class Playlist < ActiveRecord::Base

  validates :name, presence: true

end
