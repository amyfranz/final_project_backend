class Pet < ApplicationRecord
    belongs_to :user, optional: true
    has_many :posts, dependent: :destroy
    has_many :followings, dependent: :destroy
    validates :name, presence: true
    validates :bio, presence: true
    validates :profile_pic, presence: true
    validate :validateNumberOfPets

    def validateNumberOfPets
        if self.user.pets.length >= 5
            errors.add(:user, "can't have more than 5 pets")
        end
    end
end
