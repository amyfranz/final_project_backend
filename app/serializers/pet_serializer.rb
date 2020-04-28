class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :profile_pic, :user_id
  has_many :posts
  has_many :followings
end
