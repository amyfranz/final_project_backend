class User < ApplicationRecord
    has_secure_password
    has_many :pets
    has_many :followings
    has_many :likes
    has_many :comments
    validates :username, uniqueness: { case_sensitive: false }
    validates :email, uniqueness: { case_sensitive: false }
end
