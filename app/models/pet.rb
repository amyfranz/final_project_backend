class Pet < ApplicationRecord
    belongs_to :user
    has_many :posts
    has_many :followings
end
