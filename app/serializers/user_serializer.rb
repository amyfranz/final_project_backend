class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :profile_pic, :loggedin
  has_many :followings 
  has_many :pets
end
