class PostSerializer < ActiveModel::Serializer
  attributes :id, :bio, :posted
  has_many :likes
  has_many :comments
end
