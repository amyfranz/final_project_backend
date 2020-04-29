class PetSerializer < ActiveModel::Serializer
  attributes :id, :name, :bio, :profile_pic, :user_id, :posts, :number_followers

  def posts
    object.posts.select(:id, :image)
  end

  def number_followers
    object.followings.length
  end

  def user_following
   byebug
  end
end
