class Post < ApplicationRecord
    belongs_to :pet, optional: true
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    validates :image, presence: true
    validates :bio, presence: true
    validates :effect, presence: true
end
