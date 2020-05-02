class PostSerializer < ActiveModel::Serializer
  attributes :id, :image, :bio, :posted, :effect

  has_many :likes
  has_many :comments
end
