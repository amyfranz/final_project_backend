class User < ApplicationRecord
    has_secure_password
    has_many :pets, dependent: :destroy
    has_many :followings, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    validates :username, uniqueness: { case_sensitive: false }
    validates :email, uniqueness: { case_sensitive: false }
end
