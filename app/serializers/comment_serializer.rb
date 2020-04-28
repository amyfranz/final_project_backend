class CommentSerializer < ActiveModel::Serializer
  attributes :id, :post_id, :comment, :created_at
  belongs_to :user
end
