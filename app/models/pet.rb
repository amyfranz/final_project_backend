class Pet < ApplicationRecord
    belongs_to :user, optional: true
    has_many :posts, dependent: :destroy
    has_many :followings, dependent: :destroy
    validates :name, presence: true
    validates :bio, presence: true
    validates :profile_pic, presence: true
end
