class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :profile_pic, :user_id, :posts

  has_many :followings

  def posts
    object.posts.select(:id, :image)
  end
end
