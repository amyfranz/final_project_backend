class Post < ApplicationRecord
    belongs_to :pet
    has_many :likes
    has_many :comments
end
