class UserSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email, :profile_pic, :following_count, :pets
  
  def pets
    object.pets.select(:id, :name, :profile_pic, :bio)
  end

  def following_count
    object.followings.length
  end
end
