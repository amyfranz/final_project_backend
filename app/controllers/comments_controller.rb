class CommentsController < ApplicationController
    def create 
        comment = Comment.create(comment_params)
        if comment.valid?
            render json: comment.post, each_serializer: PostSerializer
        else
            render json: {message: "did not create a new comment"}
        end
    end

    def index 
        comments = Comment.all
        render json: comments
    end 

    private

    def comment_params
        params.require(:comment).permit(:post_id, :user_id, :comment, :created_at)
    end
end