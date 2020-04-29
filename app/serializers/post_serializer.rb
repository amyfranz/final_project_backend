class PostSerializer < ActiveModel::Serializer
  attributes :id, :image, :bio, :like_count, :comments

  def like_count 
    object.likes.length
  end

  def did_like
    byebug
  end

  def comments
    object.comments.select(:comment, :user_id)
  end


  # t.string "image"
  # t.text "bio"
  # t.integer "pet_id"
  # t.datetime "posted"

  # t.integer "post_id"
  # t.integer "user_id"
  # t.datetime "created_at"

  # t.integer "post_id"
  # t.integer "user_id"
  # t.text "comment"
  # t.datetime "created_at"
end
