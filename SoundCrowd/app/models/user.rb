class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :email, :password, presence: true

  has_many :playlists

  has_secure_password

end
