class User < ApplicationRecord
    has_secure_password
    has_many :pets, dependent: :destroy
    has_many :followings, dependent: :destroy
    has_many :likes, dependent: :destroy
    has_many :comments, dependent: :destroy
    validates :username, presence: true, uniqueness: { case_sensitive: false }
    validates :email, presence: true ,uniqueness: { case_sensitive: false }, format: { with: URI::MailTo::EMAIL_REGEXP } 
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :password, presence: true, on: :create
    validates :profile_pic, presence: true
    validate :edit_user_validation

    def edit_user_validation 
        id = decode_token
        errors.add(:user, id)
    end
end
