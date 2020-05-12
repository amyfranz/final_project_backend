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
    validate :edit_user_validation, on: :update

    def edit_user_validation 
        token = request.headers['Authorization']
        begin
            puts JWT.decode(token, secret).first["id"]
        rescue
            {}
        end
    end

    def secret
        ENV["MY_SECRET"]
    end
end
