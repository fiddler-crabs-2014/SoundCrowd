class User < ActiveRecord::Base
  validates :email, uniqueness: true
  validates :email, :password, presence: true
end
